class CreateReseaus < ActiveRecord::Migration
  def change
    create_table :reseaus do |t|
      t.string :nom
      t.integer :ip_id
    
      t.timestamps
    end
  end
end
