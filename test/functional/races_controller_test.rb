require 'test_helper'

class RacesControllerTest < ActionController::TestCase
  
  def setup
    @race = Factory(:race)
  end
  
  test "should get index" do
    get :index, :rotation_id => @race.rotation.to_param
    assert_response :success
    assert_not_nil assigns(:rotation)
    assert_not_nil assigns(:races)
  end

  test "should get new" do
    get :new, :rotation_id => @race.rotation.to_param
    assert_response :success
  end

  test "should create race" do
    assert_difference('Race.count') do
      post :create, :rotation_id => @race.rotation.to_param, :race => Factory.attributes_for(:race)
    end

    assert_redirected_to rotation_race_path(assigns(:rotation), assigns(:race))
  end

  test "should show race" do
    get :show, :rotation_id => @race.rotation.to_param, :id => @race.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :rotation_id => @race.rotation.to_param, :id => @race.to_param
    assert_response :success
  end

  test "should update race" do
    put :update, :rotation_id => @race.rotation.to_param, :id => @race.to_param, :race => { }
    assert_redirected_to rotation_race_path(assigns(:rotation), assigns(:race))
  end

  test "should destroy race" do
    assert_difference('Race.count', -1) do
      delete :destroy, :rotation_id => @race.rotation.to_param, :id => @race.to_param
    end

    assert_redirected_to rotation_races_path(assigns(:rotation))
  end
end
