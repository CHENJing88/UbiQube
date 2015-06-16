class CreateEtapeApps < ActiveRecord::Migration
  def change
    create_table :etape_apps do |t|
      t.string :nom，unique:true
      t.timestamps
    end
  end
end
