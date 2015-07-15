class DroitCatalogdroit < ActiveRecord::Base
  #relation many to many (droit-catalogdroit)
  belongs_to :catalog_droits, class_name: "CatalogDroit", foreign_key:"catalogdroit_id"
  belongs_to :droits, class_name: "Droit", foreign_key: "droit_id"
end
