class CreateRaces < ActiveRecord::Migration
  def self.up
    create_table :races do |t|
      t.string :name
      t.timestamps
    end

    Race.create(:name => 'Zerg')
    Race.create(:name => 'Protoss')
    Race.create(:name => 'Terran')
    Race.create(:name => 'Random')
  end

  def self.down
    drop_table :races
  end
end
