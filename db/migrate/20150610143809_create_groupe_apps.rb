class CreateGroupeApps < ActiveRecord::Migration
  def change
    create_table :groupe_apps do |t|
      t.integer :groupe_user_id,:index=>true
      t.integer :app_id,:index=>true
      t.timestamps
    end
  end
end
