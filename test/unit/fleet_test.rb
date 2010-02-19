require 'test_helper'

class FleetTest < ActiveSupport::TestCase
  
  test "should require a color" do
    fleet = Factory.build(:fleet, :color => nil)
    assert !fleet.valid?
  end
  
end
