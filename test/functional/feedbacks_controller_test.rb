require 'test_helper'

class FeedbacksControllerTest < ActionController::TestCase
  setup do
    @feedback = feedbacks(:one)
    if session[:users_id]
      @logged_in = true
    else
      @logged_in = false
    end

  end
if @logged_in then
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:feedbacks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create feedback" do
    assert_difference('Feedback.count') do
      post :create, :feedback => @feedback.attributes
    end

    assert_redirected_to feedback_path(assigns(:feedback))
  end

  test "should show feedback" do
    get :show, :id => @feedback.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @feedback.to_param
    assert_response :success
  end

  test "should update feedback" do
    put :update, :id => @feedback.to_param, :feedback => @feedback.attributes
    assert_redirected_to feedback_path(assigns(:feedback))
  end

  test "should destroy feedback" do
    assert_difference('Feedback.count', -1) do
      delete :destroy, :id => @feedback.to_param
    end

    assert_redirected_to feedbacks_path
  end
else
    test "logged out,index" do
    get :index
    assert_redirected_to home_path
  end

  test "logged out,new" do
    get :new
    assert_redirected_to home_path
  end


  #when feedbacks are added, need to add tests for
  #create,edit,show,update,destroy
  #when not logged in, all should redirect to home_path

end
end
