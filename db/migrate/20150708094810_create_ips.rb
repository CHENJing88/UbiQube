class CreateIps < ActiveRecord::Migration
  def change
    create_table :ips do |t|
      t.integer :ip_addr
      #t.binary :ip_adr,:limit=>4
      t.timestamps
    end
  end
end
