class CreateReseaus < ActiveRecord::Migration
  def change
    create_table :reseaus do |t|

      t.timestamps
    end
  end
end
