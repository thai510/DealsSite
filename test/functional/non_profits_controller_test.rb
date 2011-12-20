require 'test_helper'

class NonProfitsControllerTest < ActionController::TestCase
  setup do
    @non_profit = non_profits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:non_profits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create non_profit" do
    assert_difference('NonProfit.count') do
      post :create, :non_profit => @non_profit.attributes
    end

    assert_redirected_to non_profit_path(assigns(:non_profit))
  end

  test "should show non_profit" do
    get :show, :id => @non_profit.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @non_profit.to_param
    assert_response :success
  end

  test "should update non_profit" do
    put :update, :id => @non_profit.to_param, :non_profit => @non_profit.attributes
    assert_redirected_to non_profit_path(assigns(:non_profit))
  end

  test "should destroy non_profit" do
    assert_difference('NonProfit.count', -1) do
      delete :destroy, :id => @non_profit.to_param
    end

    assert_redirected_to non_profits_path
  end
end
