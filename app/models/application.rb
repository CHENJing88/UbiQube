class Application < ActiveRecord::Base
  belongs_to :etat_app, :class_name => "EtatApp", foreign_key:"etat_app_id"
end
