class VmInstallServiceIn < ActiveRecord::Base
  belongs_to :vms,:class_name=>"Vm", foreign_key:"vm_id", dependent: :destroy
  belongs_to :service_in_apps,:class_name=>"ServiceInApp", foreign_key:"service_in_app_id", dependent: :destroy
end
