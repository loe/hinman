class AddRepechagePercentage < ActiveRecord::Migration
  def self.up
    add_column :teams, :repechage_percentage, :integer, :default => 0
  end

  def self.down
    remove_column :teams, :repechage_percentage
  end
end
