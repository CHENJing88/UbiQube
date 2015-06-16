class CreateGroupeApps < ActiveRecord::Migration
  def change
    create_table :groupe_apps do |t|
      t.string :nom，null:false
      t.timestamps
    end
  end
end
