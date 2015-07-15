class CreateCatalogServices < ActiveRecord::Migration
  def change
    create_table :catalog_services do |t|
      t.string :nom
      t.timestamps
    end
  end
end
