require 'test_helper'

class CalculatorToolsControllerTest < ActionController::TestCase
  setup do
    @calculator_tool = calculator_tools(:one)
    @update = {}

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
      assert_not_nil assigns(:calculator_tools)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create calculator_tool" do
    assert_difference('CalculatorTool.count') do
      post :create, :calculator_tool => @update
    end

    assert_redirected_to calculator_tool_path(assigns(:calculator_tool))
  end

  test "should show calculator_tool" do
    get :show, :id => @calculator_tool.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @calculator_tool.to_param
    assert_response :success
  end

  test "should update calculator_tool" do
    put :update, :id => @calculator_tool.to_param, :calculator_tool => @calculator_tool.attributes
    assert_redirected_to calculator_tool_path(assigns(:calculator_tool))
  end

  test "should destroy calculator_tool" do
    assert_difference('CalculatorTool.count', -1) do
      delete :destroy, :id => @calculator_tool.to_param
    end

    assert_redirected_to calculator_tools_path
  end
else 
  test "logged out, index" do
    get :index
    assert_redirected_to home_path
  end

  test "logged out, new" do
    get :new
    assert_redirected_to home_path
  end

  #when calculator tools are added, need to add tests
  #for create,edit,show,update,destroy
  #when not logged in, all should redirect to home_path
end

end
