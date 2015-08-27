class UserAppRole < ActiveRecord::Base
  #validates_presence_of :app_id, :role_id
  before_validation do |model|
    model.user_id.reject!(&:blank?) if model.user_id
  end
  #la relation many to many (user-app-role)
  belongs_to :users , class_name: "User", foreign_key:"user_id" #foreign key user_id
  belongs_to :apps , class_name: "App",foreign_key:"app_id" #foreign key app_id
  belongs_to :roles , class_name: "Role",foreign_key:"role_id" #foreign key role_id

  validates_uniqueness_of :user_id, scope: [:app_id, :role_id]
end
