class CatalogService < ActiveRecord::Base
  #CatalogService est dans la relation many to many (service-catalogservice).
  has_many :service_catalogservices
  has_many :services, through: :service_catalogservices
end
