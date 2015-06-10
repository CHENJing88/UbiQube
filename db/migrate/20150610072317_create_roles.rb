class CreateRoles < ActiveRecord::Migration
  def change
    create_table :role do |t|
      t.string :name

      t.timestamps
    end
  end
end
