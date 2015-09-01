class User < ActiveRecord::Base
  #user est dans la relation many to many (user-role-app).
  #user peut avoir plusieurs roles par rapport à un App.
  #si un user est supprimé, on va supprimer tous les records dans user_app_roles
  has_many :user_app_roles, foreign_key: "user_id", dependent: :destroy
  has_many :roles, through: :user_app_roles
  has_many :apps, through: :user_app_roles

  #user est dans la relation many to many (user-groupe_user).
  #user peut dans plusieurs groupes.
  has_many :user_groupe_users, foreign_key: ":user_id"
  has_many :groupe_users, through: :user_groupe_users


  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['displayname'] || ""
         user.email = auth['info']['mail'] || ""
      end

    end
  end

end
