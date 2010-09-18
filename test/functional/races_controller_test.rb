require 'test_helper'

class RacesControllerTest < ActionController::TestCase
  
  def setup
    @race = Factory(:sideshow_vs_panda)
  end

  test "should show race" do
    get :show, :rotation_id => @race.rotation.to_param, :id => @race.to_param
    assert_response :success
  end
  
end
