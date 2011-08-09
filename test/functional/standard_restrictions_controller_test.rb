require 'test_helper'

class StandardRestrictionsControllerTest < ActionController::TestCase
  setup do
    @standard_restriction = standard_restrictions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:standard_restrictions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create standard_restriction" do
    assert_difference('StandardRestriction.count') do
      post :create, :standard_restriction => @standard_restriction.attributes
    end

    assert_redirected_to standard_restriction_path(assigns(:standard_restriction))
  end

  test "should show standard_restriction" do
    get :show, :id => @standard_restriction.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @standard_restriction.to_param
    assert_response :success
  end

  test "should update standard_restriction" do
    put :update, :id => @standard_restriction.to_param, :standard_restriction => @standard_restriction.attributes
    assert_redirected_to standard_restriction_path(assigns(:standard_restriction))
  end

  test "should destroy standard_restriction" do
    assert_difference('StandardRestriction.count', -1) do
      delete :destroy, :id => @standard_restriction.to_param
    end

    assert_redirected_to standard_restrictions_path
  end
end
