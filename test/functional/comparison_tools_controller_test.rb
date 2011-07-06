require 'test_helper'

class ComparisonToolsControllerTest < ActionController::TestCase
  setup do
    @comparison_tool = comparison_tools(:one)
  end

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
end
