class ServiceCatalogservice < ActiveRecord::Base
  #relation many to many (service-catalogservice)
  belongs_to :catalog_services, class_name: "CatalogService", foreign_key:"catalogservice_id"
  belongs_to :services, class_name: "Service", foreign_key: "service_id"
end
