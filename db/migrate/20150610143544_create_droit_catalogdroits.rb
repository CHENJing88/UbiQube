class CreateDroitCatalogdroits < ActiveRecord::Migration
  def change
    create_table :droit_catalogdroits do |t|
      t.integer :role_id, index:true
      t.integer :catalogdroit_id, index:true

      t.timestamps
    end

    add_index :droit_catalogdroits, [:role_id, :catalogdroit_id], unique:true
  end
end
