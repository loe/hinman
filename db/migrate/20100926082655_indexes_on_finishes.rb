class IndexesOnFinishes < ActiveRecord::Migration
  def self.up
    add_index :finishes, :race_id
    add_index :finishes, :boat_id
  end

  def self.down
    remove_index :finishes, :column => :boat_id
    remove_index :finishes, :column => :race_id
  end
end
