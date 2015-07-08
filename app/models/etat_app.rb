class EtatApp < ActiveRecord::Base
  has_many :apps, :class_name => "App", foreign_key:"etat_app_id"
  has_many :vms, :class_name => "Vm", foreign_key:"etat_app_id"
  has_one :application, :class_name => "Application", foreign_key:"etat_app_id"
end
