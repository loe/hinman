class NewWorldIndexes < ActiveRecord::Migration
  def self.up
    add_index :boats, :fleet_id
    add_index :entries, :fleet_id
    add_index :entries, :team_id
    add_index :entries, :race_id
  end

  def self.down
    remove_index :entries, :race_id
    remove_index :entries, :team_id
    remove_index :entries, :fleet_id
    remove_index :boats, :fleet_id
  end
end
