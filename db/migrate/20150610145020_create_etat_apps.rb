class CreateEtatApps < ActiveRecord::Migration
  def change
    create_table :etat_apps do |t|
      t.string :nom
      #t.references :etat_collection, :polymorphic=>true                       
      t.timestamps
    end
  end
end
