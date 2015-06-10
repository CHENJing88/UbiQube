class CreateEtatApps < ActiveRecord::Migration
  def change
    create_table :etat_apps do |t|

      t.timestamps
    end
  end
end
