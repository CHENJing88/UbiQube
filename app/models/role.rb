class Role < ActiveRecord::Base
  #Role est dans la relation many to many (user-role-app).
  #Role peut appartenir aux plusieurs Apps et users.
  #si un role est supprimée, on va supprimer tous les records dans user_app_roles
  has_many :user_app_roles, foreign_key: "role_id", dependent: :destroy
  has_many :users, through: :user_app_roles, source: "user_id"
  has_many :apps, through: :user_app_roles, source: "app_id"

  #Role est dans la relation many to many (role-droit).
  has_many :role_droits, foreign_key: "role_id"
  has_many :droits, through: :role_droits, source: "droit_id"

end
