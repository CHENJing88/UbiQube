class EtapeApp < ActiveRecord::Base
  belongs_to :apps, :class_name => "App", :foreign_key => "etape_app_id"
end
