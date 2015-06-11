class CreateEtatApps < ActiveRecord::Migration
  def change
    create_table :etat_apps do |t|
      t.references :etat, :polymorhic => true #intiquer polymorhic ici, il va generer
                                              #etat_id et etat_type
      t.timestamps
    end
  end
end
