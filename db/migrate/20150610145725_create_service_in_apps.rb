class CreateServiceInApps < ActiveRecord::Migration
  def change
    create_table :service_in_apps do |t|
      t.integer :app_id,:index=>true
      t.integer :service_id,:index=>true
      t.integer :port

      t.timestamps
    end

    add_index :service_in_apps, [:app_id,:service_id], unique:true
  end
end
