class CreatePlayers < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
      t.references :match
      t.references :registration
      t.references :race
      t.timestamps
    end
  end

  def self.down
    drop_table :players
  end
end
