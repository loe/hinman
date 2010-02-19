require 'test_helper'

class RaceTest < ActiveSupport::TestCase
  
  test "should create a race" do
    assert Factory.create(:race)
  end
  
end
