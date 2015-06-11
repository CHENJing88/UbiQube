class CreateDroits < ActiveRecord::Migration
  def change
    create_table :droits do |t|
      t.string :nom
      
      t.timestamps
    end
  end
end
