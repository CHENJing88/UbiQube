class Reseau < ActiveRecord::Base
  has_many :reseau_services, foreign_key: "reseau_id"
  belongs_to :ips, foreign_key: "ip_id"
end
