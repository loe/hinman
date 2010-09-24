class ChangeRotationParticipationValueDefaultToNil < ActiveRecord::Migration
  def self.up
    change_column :rotations, :participation_value, :integer, :default => nil
  end

  def self.down
    change_column :rotations, :participation_value, :integer, :default => 0
  end
end
