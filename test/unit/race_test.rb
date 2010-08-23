require 'test_helper'

class RaceTest < ActiveSupport::TestCase
  
  test "should create a race" do
    assert Factory.create(:race)
  end
  
  test "name should be Team A vs Team B" do
    puts Factory.create(:sideshow_vs_panda).entries.inspect
    assert_equal Factory.create(:sideshow_vs_panda).name, 'NYYC Silver Panda vs. Seattle Sideshow'
  end
  
end
