class UserGroupeUser < ActiveRecord::Base
  #la relation many to many (user-groupe_user)
  belongs_to :users , class_name: "User"
  belongs_to :groupe_users , class_name: "GroupeUser"

end
