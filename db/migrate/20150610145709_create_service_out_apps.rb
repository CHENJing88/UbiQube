class CreateServiceOutApps < ActiveRecord::Migration
  def change
    create_table :service_out_apps do |t|

      t.timestamps
    end
  end
end
