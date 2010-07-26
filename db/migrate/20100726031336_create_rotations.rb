class CreateRotations < ActiveRecord::Migration
  def self.up
    create_table :rotations do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :rotations
  end
end
