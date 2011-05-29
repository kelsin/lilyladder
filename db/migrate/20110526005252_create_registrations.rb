class CreateRegistrations < ActiveRecord::Migration
  def self.up
    create_table :registrations do |t|
      t.references :season
      t.references :user
      t.references :race
      t.timestamps
    end
  end

  def self.down
    drop_table :registrations
  end
end
