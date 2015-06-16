class CreateGroupeApps < ActiveRecord::Migration
  def change
    create_table :groupe_apps do |t|
      t.string :nom，unique:true
      t.timestamps
    end
  end
end
