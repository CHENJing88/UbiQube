class CreateServiceCatalogservices < ActiveRecord::Migration
  def change
    create_table :service_catalogservices do |t|

      t.timestamps
    end
  end
end
