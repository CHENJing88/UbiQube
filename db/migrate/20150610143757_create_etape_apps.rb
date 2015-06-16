class CreateEtapeApps < ActiveRecord::Migration
  def change
    create_table :etape_apps do |t|
      t.string :nom，null:false
      t.timestamps
    end
  end
end
