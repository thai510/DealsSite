require 'test_helper'

class ErrorsControllerTest < ActionController::TestCase
  test "should get wander" do
    get :wander
    assert_response :success
  end

end
