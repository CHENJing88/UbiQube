class UserAppRole < ActiveRecord::Base
  #la relation many to many (user-app-role)
  belongs_to :users , class_name: "User", foreign_key:"user_id" #foreign key user_id
  belongs_to :apps , class_name: "App",foreign_key:"app_id" #foreign key app_id
  belongs_to :roles , class_name: "Role",foreign_key:"role_id" #foreign key role_id

end
