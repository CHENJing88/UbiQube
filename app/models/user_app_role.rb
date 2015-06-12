class UserAppRole < ActiveRecord::Base
  #la relation many to many (user-app-role)
  belongs_to :users , class_name: "User"#foreign key idUser_uar
  belongs_to :apps , class_name: "App" #foreign key idApp_uar
  belongs_to :roles , class_name: "Role"#foreign key idRole_uar

end
