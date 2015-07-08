class ReseauService < ActiveRecord::Base
  belongs_to :reseaus, :class_name => "Reseau", foreign_key: "reseau_id"
  belongs_to :service_in_apps, :class_name=> "ServiceInApp", foreign_key: "service_in_app_id"

end
