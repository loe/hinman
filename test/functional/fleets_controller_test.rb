require 'test_helper'

class FleetsControllerTest < ActionController::TestCase
  
  def setup
    @fleet = Factory(:fleet)
  end
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fleets)
  end

  test "should show fleet" do
    get :show, :id => @fleet.to_param
    assert_response :success
  end
end
