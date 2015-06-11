class GroupeUser < ActiveRecord::Base

  #groupe_user est dans la relation many to many (user-groupe_user).
  #groupe_user peut avoir plusieurs users.
  has_many :user_groupe_users, foreign_key: ":groupe_user_id"
  has_many :users, through: :user_groupe_users, source: ":user_id"

end