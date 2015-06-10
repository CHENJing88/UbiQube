class UserAppRole < ActiveRecord::Base
  belongs_to :user #foreign key idUser_uar
  belongs_to :app  #foreign key idApp_uar
  belongs_to :role #foreign key idRole_uar
end
