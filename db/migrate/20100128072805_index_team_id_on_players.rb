class IndexTeamIdOnPlayers < ActiveRecord::Migration
  def self.up
    add_index :players, :team_id
  end

  def self.down
    remove_index :players, :team_id
  end
end
