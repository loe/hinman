require 'test_helper'

class PlayersControllerTest < ActionController::TestCase
  
  def setup
    @player = Factory(:player)
  end
  
  test "should get index" do
    get :index, :team_id => @player.team.to_param
    assert_response :success
    assert_not_nil assigns(:team)
    assert_not_nil assigns(:players)
  end
  
  test "should show player" do
    get :show, :team_id => @player.team.to_param, :id => @player.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :team_id => @player.team.to_param, :id => @player.to_param
    assert_response :success
  end

  test "should update player" do
    put :update, :team_id => @player.team.to_param, :id => @player.to_param, :player => { }
    assert_redirected_to team_player_path(assigns(:team), assigns(:player))
  end
end
