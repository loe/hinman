class MarkEveryoneElseAsNotGhost < ActiveRecord::Migration
  def self.up
    Team.where("name != 'Bye'").each do |t|
      t.ghost = false
      t.save!
    end
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
