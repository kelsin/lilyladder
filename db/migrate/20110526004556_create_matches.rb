class CreateMatches < ActiveRecord::Migration
  def self.up
    create_table :matches do |t|
      t.references :round
      t.references :winner
      t.integer :group
      t.time :reported_at
      t.timestamps
    end
  end

  def self.down
    drop_table :matches
  end
end
