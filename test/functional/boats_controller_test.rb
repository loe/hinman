require 'test_helper'

class BoatsControllerTest < ActionController::TestCase
  
  def setup
    @boat = Factory(:boat, :fleet => Factory(:fleet))
  end
  
  test "should get index" do
    get :index, :fleet_id => @boat.fleet.to_param
    assert_response :success
    assert_not_nil assigns(:boats)
  end

  test "should show boat" do
    get :show, :fleet_id => @boat.fleet.to_param, :id => @boat.to_param
    assert_response :success
  end
end
