class CreateUserAppRoles < ActiveRecord::Migration
  def change
   create_table :user_app_roles do |t|
      t.belongs_to :user, index: true
      t.belongs_to :app, index: true
      t.belongs_to :role, index: false
    end
  end
end
