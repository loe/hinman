class GhostColumnForTeams < ActiveRecord::Migration
  def self.up
    add_column :teams, :ghost, :boolean, :default => false
  end

  def self.down
    remove_column :teams, :ghost
  end
end
