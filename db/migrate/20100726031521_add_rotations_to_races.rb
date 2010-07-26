class AddRotationsToRaces < ActiveRecord::Migration
  def self.up
    add_column :races, :rotation_id, :integer
    add_index :races, :rotation_id
  end

  def self.down
    remove_index :races, :rotation_id
    remove_column :races, :rotation_id
  end
end