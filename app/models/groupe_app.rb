class GroupeApp < ActiveRecord::Base
  belongs_to :apps, :class_name => "App", :foreign_key => "groupe_app_id"
end
