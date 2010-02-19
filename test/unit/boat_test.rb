require 'test_helper'

class BoatTest < ActiveSupport::TestCase

  test "should require a bow #" do
    boat = Factory.build(:boat, :bow => nil)
    assert !boat.valid?
  end
  
  test "should require a fleet" do
    boat = Factory.build(:boat, :fleet => nil)
    assert !boat.valid?
  end

end
