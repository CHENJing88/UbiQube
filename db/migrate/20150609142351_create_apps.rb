class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :nom
      t.string :niveau

      t.integer :etat_id
      t.integer :etape_id
      t.integer :groupe_app_id

      t.timestamps
    end

    add_index :apps , :etat_id
    add_index :apps , :etape_id
    add_index :apps , :groupe_app_id
  end
end
