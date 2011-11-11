class AddReplayToGame < ActiveRecord::Migration
  def self.up
    change_table(:games) do |t|
      t.string :replay
    end
  end

  def self.down
    change_table(:games) do |t|
      t.remove :replay
    end
  end
end
