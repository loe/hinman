require 'test_helper'

class PlayersControllerTest < ActionController::TestCase
  
  def setup
    @player = Factory(:player)
  end
  
  test "should show player" do
    get :show, :team_id => @player.team.to_param, :id => @player.to_param
    assert_response :success
  end
end
