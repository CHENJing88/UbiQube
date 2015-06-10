class CreateCatalogDroits < ActiveRecord::Migration
  def change
    create_table :catalog_droits do |t|

      t.timestamps
    end
  end
end
