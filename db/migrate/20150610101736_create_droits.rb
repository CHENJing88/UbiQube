class CreateDroits < ActiveRecord::Migration
  def change
    create_table :droits do |t|

      t.timestamps
    end
  end
end
