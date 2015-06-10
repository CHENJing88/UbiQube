class CreateEtapeApps < ActiveRecord::Migration
  def change
    create_table :etape_apps do |t|

      t.timestamps
    end
  end
end
