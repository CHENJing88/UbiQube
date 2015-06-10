class CreateGroupeApps < ActiveRecord::Migration
  def change
    create_table :groupe_apps do |t|

      t.timestamps
    end
  end
end
