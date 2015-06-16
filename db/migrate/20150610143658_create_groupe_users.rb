class CreateGroupeUsers < ActiveRecord::Migration
  def change
    create_table :groupe_users do |t|
      t.string :nom，null:false
      t.timestamps
    end
  end
end
