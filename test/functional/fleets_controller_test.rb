require 'test_helper'

class FleetsControllerTest < ActionController::TestCase
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
      post :create, :fleet => { }
    end

    assert_redirected_to fleet_path(assigns(:fleet))
  end

  test "should show fleet" do
    get :show, :id => fleets(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => fleets(:one).to_param
    assert_response :success
  end

  test "should update fleet" do
    put :update, :id => fleets(:one).to_param, :fleet => { }
    assert_redirected_to fleet_path(assigns(:fleet))
  end

  test "should destroy fleet" do
    assert_difference('Fleet.count', -1) do
      delete :destroy, :id => fleets(:one).to_param
    end

    assert_redirected_to fleets_path
  end
end
