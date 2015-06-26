class EtatApp < ActiveRecord::Base
  has_many :apps, :class_name => "App", foreign_key:"etat_app_id"
end
