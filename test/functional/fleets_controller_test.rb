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

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fleet" do
    assert_difference('Fleet.count') do
      post :create, :fleet => Factory.attributes_for(:fleet)
    end

    assert_redirected_to fleet_path(assigns(:fleet))
  end

  test "should show fleet" do
    get :show, :id => @fleet.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @fleet.to_param
    assert_response :success
  end

  test "should update fleet" do
    put :update, :id => @fleet.to_param, :fleet => { }
    assert_redirected_to fleet_path(assigns(:fleet))
  end

  test "should destroy fleet" do
    assert_difference('Fleet.count', -1) do
      delete :destroy, :id => @fleet.to_param
    end

    assert_redirected_to fleets_path
  end
end
