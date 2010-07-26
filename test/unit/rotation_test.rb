require 'test_helper'

class RotationTest < ActiveSupport::TestCase

  test "should require a name" do
    team = Factory.build(:rotation, :name => nil)
    assert !team.valid?
  end
  
end
