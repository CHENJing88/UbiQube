class ServiceInApp < ActiveRecord::Base
  has_many :reseau_services
  has_many :reseaus, through: :reseau_services

  has_many :vm_install_service_ins
  has_many :vms, through: :vm_install_service_ins

  has_many :service_out_apps

  belongs_to :service, foreign_key:"service_id"
  belongs_to :app, foreign_key:"app_id"

  accepts_nested_attributes_for :reseau_services, :service_out_apps, :vm_install_service_ins, :app

end
