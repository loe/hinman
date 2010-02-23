require 'test_helper'

class BoatsControllerTest < ActionController::TestCase
  
  def setup
    @boat = Factory(:boat)
  end
  
  test "should get index" do
    get :index, :fleet_id => @boat.fleet.to_param
    assert_response :success
    assert_not_nil assigns(:boats)
  end

  test "should get new" do
    get :new, :fleet_id => @boat.fleet.to_param
    assert_response :success
  end

  test "should create boat" do
    assert_difference('Boat.count') do
      post :create, :fleet_id => @boat.fleet.to_param, :boat => Factory.attributes_for(:boat)
    end

    assert_redirected_to fleet_boat_path(assigns(:fleet), assigns(:boat))
  end

  test "should show boat" do
    get :show, :fleet_id => @boat.fleet.to_param, :id => @boat.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :fleet_id => @boat.fleet.to_param, :id => @boat.to_param
    assert_response :success
  end

  test "should update boat" do
    put :update, :fleet_id => @boat.fleet.to_param, :id => @boat.to_param, :boat => { }
    assert_redirected_to fleet_boat_path(assigns(:fleet), assigns(:boat))
  end

  test "should destroy boat" do
    assert_difference('Boat.count', -1) do
      delete :destroy, :fleet_id => @boat.fleet.to_param, :id => @boat.to_param
    end

    assert_redirected_to fleet_boats_path(assigns(:fleet))
  end
end
