require 'test_helper'

class TeamTest < ActiveSupport::TestCase

  test "should require a name" do
    team = Factory.build(:team, :name => nil)
    assert !team.valid?
  end
  
end
