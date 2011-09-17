require 'test_helper'

class PrivateDealCodesControllerTest < ActionController::TestCase
  setup do
    @private_deal_code = private_deal_codes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:private_deal_codes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create private_deal_code" do
    assert_difference('PrivateDealCode.count') do
      post :create, :private_deal_code => @private_deal_code.attributes
    end

    assert_redirected_to private_deal_code_path(assigns(:private_deal_code))
  end

  test "should show private_deal_code" do
    get :show, :id => @private_deal_code.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @private_deal_code.to_param
    assert_response :success
  end

  test "should update private_deal_code" do
    put :update, :id => @private_deal_code.to_param, :private_deal_code => @private_deal_code.attributes
    assert_redirected_to private_deal_code_path(assigns(:private_deal_code))
  end

  test "should destroy private_deal_code" do
    assert_difference('PrivateDealCode.count', -1) do
      delete :destroy, :id => @private_deal_code.to_param
    end

    assert_redirected_to private_deal_codes_path
  end
end
