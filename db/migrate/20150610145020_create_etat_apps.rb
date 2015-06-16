class CreateEtatApps < ActiveRecord::Migration
  def change
    create_table :etat_apps do |t|
      t.string :nom
      t.references :etat_collection, :polymorphic=>true                                        #etat_id et etat_type
      t.timestamps
    end
  end
end
