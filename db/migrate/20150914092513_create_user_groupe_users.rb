class CreateUserGroupeUsers < ActiveRecord::Migration
  def change
    create_table :user_groupe_users do |t|
      t.integer :groupe_user_id
      t.integer :user_id

      t.timestamps
    end

    add_index :user_groupe_users, :user_id
    add_index :user_groupe_users, :groupe_user_id
    add_index :user_groupe_users, [:user_id, :groupe_user_id], unique:true
  end
end
