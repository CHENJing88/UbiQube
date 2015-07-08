class Vm < ActiveRecord::Base
  has_many :vm_install_service_ins,foreign_key:"vm_id"
  has_many :service_in_apps, through: :vm_install_service_ins
  belongs_to :etat_apps, :class_name => "EtatApp", foreign_key:"etat_app_id"
end
