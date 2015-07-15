class Service < ActiveRecord::Base
  has_many :service_in_apps
  has_many :apps, through: :service_in_apps
end
