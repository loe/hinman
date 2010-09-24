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
end
