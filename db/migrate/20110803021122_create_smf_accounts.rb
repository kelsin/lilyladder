class CreateSmfAccounts < ActiveRecord::Migration
  def self.up
    create_table(:smf2rc4_members, :primary_key => 'id_member') do |t|
      t.string :member_name
      t.string :email_address
      t.string :passwd
      t.integer :id_group
    end
  end

  def self.down
    drop_table :smf2rc4_members
  end
end
