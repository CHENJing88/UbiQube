class ServiceOutApp < ActiveRecord::Base
  belongs_to :app,:class_name=>"App",foreign_key:"app_id"
  belongs_to :service_in_app,:class_name=>"ServiceInApp",foreign_key:"service_in_app_id"
end
