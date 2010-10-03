class MarkByeAsGhost < ActiveRecord::Migration
  def self.up
    g = Team.find_by_name('Bye')
    g.ghost = true
    g.save!
  end

  def self.down
  end
end
