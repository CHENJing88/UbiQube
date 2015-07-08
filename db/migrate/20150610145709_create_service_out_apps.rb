class CreateServiceOutApps < ActiveRecord::Migration
  def change
    create_table :service_out_apps do |t|
      t.integer :app_id,:index=>true
      t.integer :service_in_app_id,:index=>true

      t.timestamps
    end
    add_index :service_out_apps, [:app_id, :service_in_app_id], unique:true
  end
end
