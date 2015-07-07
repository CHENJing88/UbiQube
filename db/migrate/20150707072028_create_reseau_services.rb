class CreateReseauServices < ActiveRecord::Migration
  def change
    create_table :reseau_services do |t|

      t.timestamps
    end
  end
end
