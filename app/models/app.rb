class App < ActiveRecord::Base
  #validation d'existance
  validates_presence_of :nom, :on => :save

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
  accepts_nested_attributes_for :user_app_roles, allow_destroy: true, reject_if: :reject_uars
  accepts_nested_attributes_for  :service_in_apps, allow_destroy: true

  scope :envoie, -> { where(is_envoye: true) }

  def reject_uars(attributed)
    attributed['user_id'].blank? || attributed['app_id'].blank? || attributed['role_id'].blank?
  end

  def user_app_roles_attributes=(user_app_role_attributes)
    #user_app_role_attributes.each do |attributes|
      if user_app_role_attributes['id'].present?
        self.user_app_roles= UserAppRole.find(user_app_role_attributes['id'])
      end
      #user_app_roles.build(attributes)
    #end
  end

end
