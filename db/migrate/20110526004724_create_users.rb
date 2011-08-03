class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :smf_id
      t.boolean :admin
      t.references :race
      t.timestamps
    end

    change_table :users do |t|
      t.index :name
      t.index :email
      t.index :smf_id
    end
  end

  def self.down
    drop_table :users
  end
end
