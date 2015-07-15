class CreateServiceCatalogservices < ActiveRecord::Migration
  def change
    create_table :service_catalogservices do |t|
      t.integer :serv_id, index:true
      t.integer :catalogserv_id, index:true

      t.timestamps
    end

    add_index :service_catalogservices, [:serv_id, :catalogserv_id], unique:true
    end

end
