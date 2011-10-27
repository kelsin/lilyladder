class AddBestOfToMatches < ActiveRecord::Migration
  def self.up
    change_table(:matches) do |t|
      t.integer :best_of
    end
  end

  def self.down
    change_table(:matches) do |t|
      t.remove :best_of
    end
  end
end
