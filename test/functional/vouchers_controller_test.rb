require 'test_helper'

class VouchersControllerTest < ActionController::TestCase
  setup do
    @voucher = vouchers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vouchers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create voucher" do
    assert_difference('Voucher.count') do
      post :create, :voucher => @voucher.attributes
    end

    assert_redirected_to voucher_path(assigns(:voucher))
  end

  test "should show voucher" do
    get :show, :id => @voucher.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @voucher.to_param
    assert_response :success
  end

  test "should update voucher" do
    put :update, :id => @voucher.to_param, :voucher => @voucher.attributes
    assert_redirected_to voucher_path(assigns(:voucher))
  end

  test "should destroy voucher" do
    assert_difference('Voucher.count', -1) do
      delete :destroy, :id => @voucher.to_param
    end

    assert_redirected_to vouchers_path
  end
end
