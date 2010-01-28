require 'test_helper'

class PlayerTest < ActiveSupport::TestCase

  test "should require a name" do
    player = Factory.build(:player, :name => nil)
    assert !player.valid?
  end
  
  test "should require a team" do
    player = Factory.build(:player, :team => nil)
    assert !player.valid?
  end
end
