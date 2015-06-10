class CreateUserGroupeUsers < ActiveRecord::Migration
  def change
    create_table :user_groupe_users do |t|

      t.timestamps
    end
  end
end
