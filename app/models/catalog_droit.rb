class CatalogDroit < ActiveRecord::Base
  #CatalogDroit est dans la relation many to many (droit-catalogdroit).
  has_many :droit_catalogdroits, foreign_key: "catalogdroit_id"
  has_many :droits, through: :droit_catalogdroits, source: "droit_id"

end
