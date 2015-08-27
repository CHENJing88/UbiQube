class App < ActiveRecord::Base
  before_validation do |model|
    model.subset_array.reject!(&:blank?) if model.subset_array
  end
  #les attributs modifable
  #attr_accessible :nom, :niveau, :etat_id, :etape_id, :groupe_app_id
  #validation d'existance
  validates_presence_of :nom

  #relation d'APP
  #si une App est supprimée, on va supprimer tous les records dans user_app_roles
  has_many :user_app_roles, foreign_key: "app_id", dependent: :destroy
  #APP a plusieurs users et roles(many to many)
  has_many :users, through: :user_app_roles
  has_many :roles, through: :user_app_roles

  has_many :service_out_apps, foreign_key: "app_id", dependent: :destroy
  has_many :service_in_apps, foreign_key: "app_id", dependent: :destroy
  has_many :services, through: :service_in_apps

  belongs_to :etape_app,:class_name => "EtapeApp", foreign_key:"etape_app_id"
  belongs_to :etat_app, :class_name => "EtatApp", foreign_key:"etat_app_id"
  belongs_to :groupe_app,:class_name => "GroupeApp", foreign_key:"groupe_app_id"

  #default_scope order: 'apps.created_at DESC'
  accepts_nested_attributes_for :user_app_roles,:service_in_apps

  scope :is_envoye, -> { where(is_envoye: true) }

  def user_app_role_attributes=(user_app_role_attributes)
    user_app_role_attributes.each do |attributes|
      user_app_roles.build(attributes)
    end
  end

end
