class CreateCatalogDroits < ActiveRecord::Migration
  def change
    create_table :catalog_droits do |t|
      t.string :nom，null:false

      t.timestamps
    end
  end
end
