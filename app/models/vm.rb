class Vm < ActiveRecord::Base
  validates_presence_of :nom
  has_many :vm_install_service_ins
  has_many :service_in_apps, through: :vm_install_service_ins
  has_many :services, through: :vm_install_service_ins
end
