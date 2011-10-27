class AddBestOfToRounds < ActiveRecord::Migration
  def self.up
    change_table(:rounds) do |t|
      t.integer :best_of
    end
  end

  def self.down
    change_table(:rounds) do |t|
      t.remove :best_of
    end
  end
end
