class AddParticipationValueToRotations < ActiveRecord::Migration
  def self.up
    add_column :rotations, :participation_value, :integer, :default => 0
  end

  def self.down
    remove_column :rotations, :participation_value
  end
end