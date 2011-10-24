class AddBnetIdToUser < ActiveRecord::Migration
  def self.up
    change_table(:users) do |t|
      t.string :bnet_name
      t.string :bnet_code
    end
  end

  def self.down
    change_table(:users) do |t|
      t.remove :bnet_name
      t.remove :bnet_code
    end
  end
end
