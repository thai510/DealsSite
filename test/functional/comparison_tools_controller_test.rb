require 'test_helper'

class ComparisonToolsControllerTest < ActionController::TestCase
  setup do
    @comparison_tool = comparison_tools(:one)
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
      assert_not_nil assigns(:comparison_tools)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comparison_tool" do
    assert_difference('ComparisonTool.count') do
      post :create, :comparison_tool => @comparison_tool.attributes
    end

    assert_redirected_to comparison_tool_path(assigns(:comparison_tool))
  end

  test "should show comparison_tool" do
    get :show, :id => @comparison_tool.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @comparison_tool.to_param
    assert_response :success
  end

  test "should update comparison_tool" do
    put :update, :id => @comparison_tool.to_param, :comparison_tool => @comparison_tool.attributes
    assert_redirected_to comparison_tool_path(assigns(:comparison_tool))
  end

  test "should destroy comparison_tool" do
    assert_difference('ComparisonTool.count', -1) do
      delete :destroy, :id => @comparison_tool.to_param
    end

    assert_redirected_to comparison_tools_path
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


  #when tools are added, need to add tests for
  #create,edit,show,update,destroy
  #when not logged in, all should redirect to home_path

end
end
