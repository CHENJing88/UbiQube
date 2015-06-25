class EtatApp < ActiveRecord::Base
  has_many :apps, :class_name => "App"
end
