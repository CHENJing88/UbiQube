class GroupeApp < ActiveRecord::Base
  belongs_to :apps, :class_name => "App"
end
