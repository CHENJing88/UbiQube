class GroupeApp < ActiveRecord::Base
  belongs_to :app
  belongs_to :groupe_user
end
