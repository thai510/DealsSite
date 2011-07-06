require 'test_helper'

class DealBuildersControllerTest < ActionController::TestCase
  setup do
    @deal_builder = deal_builders(:one)
  end

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
end
