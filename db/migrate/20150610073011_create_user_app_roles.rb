class CreateUserAppRoles < ActiveRecord::Migration
  def change
    create_table :user_app_roles do |t|
      t.integer :user_id,:index=>true
      t.integer :app_id,:index=>true
      t.integer :role_id,:index=>true

      t.timestamps
    end

    add_index :user_app_roles, [:user_id, :app_id], unique:true
  end
end
