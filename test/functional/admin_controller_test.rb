require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    if session[:users_id] 
      assert_response :success
    else
      assert_redirected_to home_path
    end
  end

end
