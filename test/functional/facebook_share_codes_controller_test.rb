require 'test_helper'

class FacebookShareCodesControllerTest < ActionController::TestCase
  setup do
    @facebook_share_code = facebook_share_codes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:facebook_share_codes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create facebook_share_code" do
    assert_difference('FacebookShareCode.count') do
      post :create, :facebook_share_code => @facebook_share_code.attributes
    end

    assert_redirected_to facebook_share_code_path(assigns(:facebook_share_code))
  end

  test "should show facebook_share_code" do
    get :show, :id => @facebook_share_code.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @facebook_share_code.to_param
    assert_response :success
  end

  test "should update facebook_share_code" do
    put :update, :id => @facebook_share_code.to_param, :facebook_share_code => @facebook_share_code.attributes
    assert_redirected_to facebook_share_code_path(assigns(:facebook_share_code))
  end

  test "should destroy facebook_share_code" do
    assert_difference('FacebookShareCode.count', -1) do
      delete :destroy, :id => @facebook_share_code.to_param
    end

    assert_redirected_to facebook_share_codes_path
  end
end
