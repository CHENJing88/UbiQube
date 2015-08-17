class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :nom
      t.float :version
      t.string :uid_admin
      t.string :uid_dsi
      t.integer :etat_id,index:true

      t.timestamps
    end

  end




end
