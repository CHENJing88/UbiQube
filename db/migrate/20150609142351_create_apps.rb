class CreateApps < ActiveRecord::Migration
  def self.up
    create_table :apps do |t|
      t.string :nom
      t.string :niveau
      t.string :description
      t.boolean :envoie, :default=>false
      t.integer :etat_app_id,:index=>true
      t.integer :etape_app_id,:index=>true
      t.integer :groupe_app_id,:index=>true
      t.timestamps
    end
  end

  def self.down
    drop_table :apps
  end


end
