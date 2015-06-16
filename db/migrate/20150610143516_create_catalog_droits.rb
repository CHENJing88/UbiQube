class CreateCatalogDroits < ActiveRecord::Migration
  def change
    create_table :catalog_droits do |t|
      t.string :nom, unique: true

      t.timestamps
    end
  end
end
