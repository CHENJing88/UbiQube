class GroupeApp < ActiveRecord::Base
  belongs_to :app, :class_name => "App"
end
