class Ip < ActiveRecord::Base
  has_one :reseau
  has_one :vm_install_service_in
  has_one :vm
end
