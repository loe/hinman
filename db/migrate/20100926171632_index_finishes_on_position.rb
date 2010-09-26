class IndexFinishesOnPosition < ActiveRecord::Migration
  def self.up
    add_index :finishes, :position
  end

  def self.down
    remove_index :finishes, :column => :position
  end
end
