class CreateApps < ActiveRecord::Migration
  def self.up
    create_table :apps do |t|
      t.string :nom
      t.string :niveau
      t.string :description
      t.integer :etat_app_id
      t.integer :etape_id
      t.integer :groupe_app_id

      t.timestamps
    end

  def self.down
    drop_table :apps
  end
    #add_index :apps , :etat_app_id
    #add_index :apps , :etape_id
    #add_index :apps , :groupe_app_id
  end
end
