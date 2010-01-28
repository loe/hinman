class AssociatePlayerAndTeams < ActiveRecord::Migration
  def self.up
    add_column :players, :team_id, :integer
  end

  def self.down
    remove_column :players, :team_id
  end
end
