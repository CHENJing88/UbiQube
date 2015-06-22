class GroupeApp < ActiveRecord::Base
  has_many :apps, :class_name => "App", foreign_key:"groupe_app_id"
end
