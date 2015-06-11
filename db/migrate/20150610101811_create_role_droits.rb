class CreateRoleDroits < ActiveRecord::Migration
  def change
    create_table :role_droits do |t|
      t.integer :role_id
      t.integer :droit_id

      t.timestamps
    end

    add_index :role_droits, :role_id
    add_index :role_droits, :droit_id
    add_index :role_droits, [:role_id, :droit_id], unique:true

  end
end
