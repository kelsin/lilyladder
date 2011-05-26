class CreateRounds < ActiveRecord::Migration
  def self.up
    create_table :rounds do |t|
      t.integer :position
      t.time :starts_at
      t.time :ends_at
      t.references :season
      t.timestamps
    end
  end

  def self.down
    drop_table :rounds
  end
end
