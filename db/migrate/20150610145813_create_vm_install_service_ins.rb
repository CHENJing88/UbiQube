class CreateVmInstallServiceIns < ActiveRecord::Migration

  def change
    create_table :vm_install_service_ins do |t|
      t.integer :service_in_app_id,index:true
      t.integer :vm_id,index:true
      t.integer :ip_id

      t.timestamps
    end
    add_index :vm_install_service_ins, [:service_in_app_id,:vm_id], unique:true
  end
end
