class CreateMapPools < ActiveRecord::Migration
  def self.up
    create_table :map_pools do |t|
      t.references :season
      t.references :map
      t.timestamps
    end
  end

  def self.down
    drop_table :map_pools
  end
end
