require 'test_helper'

class DealBuildersControllerTest < ActionController::TestCase
  setup do
    @deal_builder = deal_builders(:one)

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
      assert_not_nil assigns(:deal_builders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create deal_builder" do
    assert_difference('DealBuilder.count') do
      post :create, :deal_builder => @deal_builder.attributes
    end

    assert_redirected_to deal_builder_path(assigns(:deal_builder))
  end

  test "should show deal_builder" do
    get :show, :id => @deal_builder.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @deal_builder.to_param
    assert_response :success
  end

  test "should update deal_builder" do
    put :update, :id => @deal_builder.to_param, :deal_builder => @deal_builder.attributes
    assert_redirected_to deal_builder_path(assigns(:deal_builder))
  end

  test "should destroy deal_builder" do
    assert_difference('DealBuilder.count', -1) do
      delete :destroy, :id => @deal_builder.to_param
    end

    assert_redirected_to deal_builders_path
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


  #when dealbuilders are added, need to add tests for
  #create,edit,show,update,destroy
  #when not logged in, all should redirect to home_path

end
end
