require 'test_helper'

class LinksControllerTest < ActionController::TestCase
  setup do
    @link = links(:one)

    if session[:users_id]
      @logged_in = true
    else
      @logged_in = false
    end
  end
if @logged_in then
  test "should get index" do
    get :index
    if session[:users_id] 
      assert_response :success
      assert_not_nil assigns(:links)
    else
      assert_redirected_to home_path
    end
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create link" do
    assert_difference('Link.count') do
      post :create, :link => @link.attributes
    end

    assert_redirected_to link_path(assigns(:link))
  end

  test "should show link" do
    get :show, :id => @link.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @link.to_param
    assert_response :success
  end

  test "should update link" do
    put :update, :id => @link.to_param, :link => @link.attributes
    assert_redirected_to link_path(assigns(:link))
  end

  test "should destroy link" do
    assert_difference('Link.count', -1) do
      delete :destroy, :id => @link.to_param
    end

    assert_redirected_to links_path
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


  #when links are added, need to add tests for
  #create,edit,show,update,destroy
  #when not logged in, all should redirect to home_path

end
end
