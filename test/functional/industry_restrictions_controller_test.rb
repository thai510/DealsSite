require 'test_helper'

class IndustryRestrictionsControllerTest < ActionController::TestCase
  setup do
    @industry_restriction = industry_restrictions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:industry_restrictions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create industry_restriction" do
    assert_difference('IndustryRestriction.count') do
      post :create, :industry_restriction => @industry_restriction.attributes
    end

    assert_redirected_to industry_restriction_path(assigns(:industry_restriction))
  end

  test "should show industry_restriction" do
    get :show, :id => @industry_restriction.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @industry_restriction.to_param
    assert_response :success
  end

  test "should update industry_restriction" do
    put :update, :id => @industry_restriction.to_param, :industry_restriction => @industry_restriction.attributes
    assert_redirected_to industry_restriction_path(assigns(:industry_restriction))
  end

  test "should destroy industry_restriction" do
    assert_difference('IndustryRestriction.count', -1) do
      delete :destroy, :id => @industry_restriction.to_param
    end

    assert_redirected_to industry_restrictions_path
  end
end
