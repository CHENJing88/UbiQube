class App < ActiveRecord::Base
  #les attributs modifable
 # attr_accessible :nom, :niveau, :etat_id, :etape_id, :groupe_app_id
  #validation d'existance
  #validates :nom, presence: true
  #validates :niveau, presence: true

  #relation d'APP

  #si une App est supprimée, on va supprimer tous les records dans user_app_roles
  has_many :user_app_roles, foreign_key: "app_id", dependent: :destroy
  #APP a plusieurs users et roles(many to many)
  has_many :users, through: :user_app_roles
  has_many :roles, through: :user_app_roles

  has_one :etape_apps,:class_name => "EtapeApp"
  has_one :etat_apps, :as => :etat_collection, :class_name => "EtatApp"
  has_one :groupe_apps,:class_name => "GroupeApp"

end
