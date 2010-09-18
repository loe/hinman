require 'test_helper'

class TeamsControllerTest < ActionController::TestCase
  
  def setup
    @team = Factory(:team)
  end
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teams)
  end

  test "should show team" do
    get :show, :id => @team.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @team.to_param
    assert_response :success
  end

  test "should update team" do
    put :update, :id => @team.to_param, :team => { }
    assert_redirected_to team_path(assigns(:team))
  end
end
