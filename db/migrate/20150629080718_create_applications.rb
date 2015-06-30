class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :nom
      t.float :version
      t.string :uid_admin
      t.integer :etat_id

      t.timestamps
    end
    add_index :applications , :etat_id
  end




end
