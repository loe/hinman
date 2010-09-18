class CreateFinishes < ActiveRecord::Migration
  def self.up
    create_table :finishes do |t|
      t.integer     :position
      t.references  :races
      t.references  :boats
      t.timestamps
    end
  end

  def self.down
    drop_table :finishes
  end
end
