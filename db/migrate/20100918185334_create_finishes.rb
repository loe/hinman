class CreateFinishes < ActiveRecord::Migration
  def self.up
    create_table :finishes do |t|
      t.integer     :position
      t.references  :race
      t.references  :boat
      t.timestamps
    end
  end

  def self.down
    drop_table :finishes
  end
end
