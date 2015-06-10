class CreateServiceInApps < ActiveRecord::Migration
  def change
    create_table :service_in_apps do |t|

      t.timestamps
    end
  end
end
