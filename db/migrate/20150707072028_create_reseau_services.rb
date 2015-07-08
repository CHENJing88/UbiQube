class CreateReseauServices < ActiveRecord::Migration
  def change
    create_table :reseau_services do |t|
      t.integer :reseau_id, index:true
      t.integer :service_in_app_id, index:true

      t.timestamps
      end
      add_index :reseau_services, [:reseau_id,:service_in_app_id], unique:true

  end
end
