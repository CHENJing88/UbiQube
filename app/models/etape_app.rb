class EtapeApp < ActiveRecord::Base
  belongs_to :apps, class_name: "APP"
end