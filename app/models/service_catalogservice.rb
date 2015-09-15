class ServiceCatalogservice < ActiveRecord::Base
  #relation many to many (service-catalogservice)
  belongs_to :catalog_service, class_name: "CatalogService", foreign_key:"catalogserv_id"
  belongs_to :service, class_name: "Service", foreign_key: "serv_id"
end
