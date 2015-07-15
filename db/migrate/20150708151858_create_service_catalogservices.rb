class CreateServiceCatalogservices < ActiveRecord::Migration
  def change
    create_table :service_catalogservices do |t|
      t.integer :service_id, index:true
      t.integer :catalogservice_id, index:true

      t.timestamps
    end

    add_index :service_catalogservices, [:service_id, :catalogservice_id], unique:true
    end
  
end
