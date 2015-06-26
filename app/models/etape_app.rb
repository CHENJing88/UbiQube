class EtapeApp < ActiveRecord::Base
  has_many :apps, :class_name => "App", foreign_key:"etape_app_id"
end
