class CreateVms < ActiveRecord::Migration

  def self.up
    create_table :vms do |t|
      t.string :nom
      t.integer :ip_default, index:true
      t.string :template
      t.integer :etat_app_id, :index=>true

      t.timestamps
    end
  end

  def self.down
    drop_table :vms
  end



end
