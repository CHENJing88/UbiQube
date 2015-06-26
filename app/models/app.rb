class App < ActiveRecord::Base
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

  belongs_to :etape_app,:class_name => "EtapeApp", foreign_key: "etape_app_id"
  belongs_to :etat_apps, :class_name => "EtatApp", foreign_key: "etat_app_id"
  belongs_to :groupe_app,:class_name => "GroupeApp", foreign_key:"groupe_app_id"

  #default_scope order: 'apps.created_at DESC'
  accepts_nested_attributes_for :user_app_roles，allow_destroy: true
end
