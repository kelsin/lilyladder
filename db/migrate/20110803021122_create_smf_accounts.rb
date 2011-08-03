class CreateSmfAccounts < ActiveRecord::Migration
  def self.up
    create_table :smf_accounts do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :smf_accounts
  end
end
