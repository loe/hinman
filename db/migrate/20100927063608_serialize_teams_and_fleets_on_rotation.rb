class SerializeTeamsAndFleetsOnRotation < ActiveRecord::Migration
  def self.up
    add_column :rotations, :teams, :text
    add_column :rotations, :fleets, :text
  end

  def self.down
    remove_column :rotations, :fleets
    remove_column :rotations, :teams
  end
end
