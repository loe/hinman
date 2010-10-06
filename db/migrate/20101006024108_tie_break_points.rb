class TieBreakPoints < ActiveRecord::Migration
  def self.up
    add_column :teams, :tie_break_points, :integer
  end

  def self.down
    remove_column :teams, :tie_break_points
  end
end
