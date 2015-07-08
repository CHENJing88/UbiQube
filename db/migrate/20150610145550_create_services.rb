class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :nom
      t.integer :port_defaut
      t.string :protocole
      t.boolean :is_defaut, :default => true
      t.timestamps
    end
  end
end
