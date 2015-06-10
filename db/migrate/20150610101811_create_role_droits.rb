class CreateRoleDroits < ActiveRecord::Migration
  def change
    create_table :role_droits do |t|

      t.timestamps
    end
  end
end
