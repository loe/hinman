class AddAGhostTeam < ActiveRecord::Migration
  def self.up
    Team.create!(:name => 'Bye')
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
