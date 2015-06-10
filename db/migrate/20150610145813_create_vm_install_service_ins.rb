class CreateVmInstallServiceIns < ActiveRecord::Migration
  def change
    create_table :vm_install_service_ins do |t|

      t.timestamps
    end
  end
end
