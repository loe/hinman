class CreateRaces < ActiveRecord::Migration
  def self.up
    create_table :races do |t|
      t.string :aasm_state
      t.timestamps
    end
  end

  def self.down
    drop_table :races
  end
end
