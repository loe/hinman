require 'test_helper'

class RotationTest < ActiveSupport::TestCase

  test "should require a name" do
    team = Factory.build(:rotation, :name => nil)
    assert !team.valid?
  end
  
  test "should create 6 Races for a 4 Team Rotation" do
    4.times { Factory.create(:team) }
    Factory.create(:rotation, :name => 'Complete Round Robin of 4')
    assert_equal Race.count, 3 + 2 + 1
  end
  
  test "should create 15 Races for a 6 Team Rotation" do
    6.times { Factory.create(:team) }
    Factory.create(:rotation, :name => 'Complete Round Robin of 6')
    assert_equal Race.count, 5 + 4 + 3 + 2 + 1
  end
  
end