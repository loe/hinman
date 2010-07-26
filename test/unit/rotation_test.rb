require 'test_helper'

class RotationTest < ActiveSupport::TestCase

  test "should require a name" do
    team = Factory.build(:rotation, :name => nil)
    assert !team.valid?
  end
  
  test "generating should create the right number of races" do
    4.times { Factory.create(:team) }
    rotation = Factory.create(:rotation, :name => 'Complete Round Robin')
    rotation.generate!
    assert_equal Race.count, 6
  end
  
end