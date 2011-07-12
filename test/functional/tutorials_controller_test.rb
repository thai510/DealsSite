require 'test_helper'

class TutorialsControllerTest < ActionController::TestCase
  setup do
    @tutorial = tutorials(:one)
    @update  = {
      :topic => "MoreStuff",
      :content => "Blaha yeah bliah bliajwerjkflili"
    }
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
    assert_not_nil assigns(:tutorials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tutorial" do
      assert_difference('Tutorial.count') do
        post :create, :tutorial => {:topic => "a", :content => "b"} 
      end
 
      assert_redirected_to tutorials_path(assigns(:tutorial))
  end

  test "should show tutorial" do
    get :show, :id => @tutorial.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @tutorial.to_param
    assert_response :success
  end

  test "should update tutorial" do
    put :update, :id => @tutorial.to_param, :tutorial => @tutorial.attributes
    assert_redirected_to tutorial_path(assigns(:tutorial))
  end

  test "should destroy tutorial" do
    assert_difference('Tutorial.count', -1) do
      delete :destroy, :id => @tutorial.to_param
    end

    assert_redirected_to tutorials_path
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


  #when tutorials are added, need to add tests for
  #create,edit,show,update,destroy
  #when not logged in, all should redirect to home_path
end

end
