class AddPenaltiesToRaces < ActiveRecord::Migration
  def self.up
    add_column :races, :home_penalty, :integer, :default => 0
    add_column :races, :away_penalty, :integer, :default => 0
  end

  def self.down
    remove_column :races, :away_penalty
    remove_column :races, :home_penalty
  end
end