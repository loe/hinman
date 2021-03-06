require 'test_helper'

class RotationTest < ActiveSupport::TestCase
  
  def setup
    ['Blue', 'Pink', 'Black', 'Orange', 'Red', 'White', 'Yellow', 'Grey'].each do |color|
      Factory.create(:fleet, :color => color)
    end
  end
  
  test "should require a name" do
    rotation = Factory.build(:rotation, :name => nil)
    assert !rotation.valid?
  end

  test "should require a participation_value" do
    rotation = Factory.build(:rotation, :participation_value => nil)
    assert !rotation.valid?
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
  
  test "#participants should list the teams in alphabetical order" do
    Factory.create(:team, :name => 'A')
    Factory.create(:team, :name => 'B')
    Factory.create(:team, :name => 'C')
    Factory.create(:team, :name => 'D')
    assert_equal Factory.create(:rotation).participants, 'A, B, C, and D'
  end
  
end
