class CreateUserAppRoles < ActiveRecord::Migration
  def change
    create_table :user_app_roles do |t|
      t.integer :user_id
      t.integer :app_id,:index=>true
      t.integer :role_id

      t.timestamps
    end

    add_index :user_app_roles, [:user_id, :app_id, :role_id], unique:true
  end
end
