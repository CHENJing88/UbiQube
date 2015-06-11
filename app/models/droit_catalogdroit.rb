class DroitCatalogdroit < ActiveRecord::Base
  #relation many to many (droit-catalogdroit)
  belongs_to :catalog_droits, class_name: "CatalogDroit"
  belongs_to :droits, class_name: "Droit"
end
