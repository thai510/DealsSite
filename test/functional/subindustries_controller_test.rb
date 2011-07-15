require 'test_helper'

class SubindustriesControllerTest < ActionController::TestCase
  setup do
    @subindustry = subindustries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subindustries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subindustry" do
    assert_difference('Subindustry.count') do
      post :create, :subindustry => @subindustry.attributes
    end

    assert_redirected_to subindustry_path(assigns(:subindustry))
  end

  test "should show subindustry" do
    get :show, :id => @subindustry.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @subindustry.to_param
    assert_response :success
  end

  test "should update subindustry" do
    put :update, :id => @subindustry.to_param, :subindustry => @subindustry.attributes
    assert_redirected_to subindustry_path(assigns(:subindustry))
  end

  test "should destroy subindustry" do
    assert_difference('Subindustry.count', -1) do
      delete :destroy, :id => @subindustry.to_param
    end

    assert_redirected_to subindustries_path
  end
end
