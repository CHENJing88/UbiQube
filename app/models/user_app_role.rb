class UserAppRole < ActiveRecord::Base
  #la relation many to many (user-app-role)
  belongs_to :users , class_name: "User"#foreign key user_id
  belongs_to :apps , class_name: "App" #foreign key app_id
  belongs_to :roles , class_name: "Role"#foreign key role_id

end
