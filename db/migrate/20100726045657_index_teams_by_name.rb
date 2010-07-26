class IndexTeamsByName < ActiveRecord::Migration
  def self.up
    add_index :teams, :name
  end

  def self.down
    remove_index :teams, :name
  end
end