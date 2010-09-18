require 'test_helper'

class RaceTest < ActiveSupport::TestCase
  
  test "should create a race" do
    assert Factory.create(:race)
  end
  
  test "name should be Team A vs Team B" do
    assert_match /Seattle Sideshow vs. NYYC Silver Panda/, Factory.create(:sideshow_vs_panda).name
  end
  
end
