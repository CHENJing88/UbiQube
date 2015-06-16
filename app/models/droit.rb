class Droit < ActiveRecord::Base
  #Droit est dans la relation many to many (role-droit).
  has_many :role_droits, foreign_key: "droit_id"
  has_many :roles, through: :role_droits

  #Role est dans la relation many to many (droit-catalogdroit).
  has_many :droit_catalogdroits, foreign_key: "droit_id"
  has_many :catalog_droits, through: :droit_catalogdroits
end
