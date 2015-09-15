class UserGroupeUser < ActiveRecord::Base
  #validates_presence_of :user_id, :groupe_user_id
  #before_validation do |model|
    #model.user_id.reject!(&:blank?) if model.user_id
  #end
  #la relation many to many (user-app-role)
  belongs_to :user  #, class_name: "User", foreign_key:"user_id" foreign key user_id
  belongs_to :groupe_user  #, class_name: "GroupeUser",foreign_key:"groupe_user_id"#foreign key app_id,

end
