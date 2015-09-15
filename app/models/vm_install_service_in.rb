class VmInstallServiceIn < ActiveRecord::Base
  belongs_to :vm,:class_name=>"Vm", foreign_key:"vm_id", dependent: :destroy
  belongs_to :service_in_app,:class_name=>"ServiceInApp", foreign_key:"service_in_app_id", dependent: :destroy
end
