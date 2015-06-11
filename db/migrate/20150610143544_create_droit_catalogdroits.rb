class CreateDroitCatalogdroits < ActiveRecord::Migration
  def change
    create_table :droit_catalogdroits do |t|
      t.integer :role_id
      t.integer :catalogdroit_id

      t.timestamps
    end

    add_index :droit_catalogdroits, :role_id
    add_index :droit_catalogdroits, :catalogdroit_id
    add_index :droit_catalogdroits, [:role_id, :catalogdroit_id], unique:true
  end
end
