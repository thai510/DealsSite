require 'test_helper'

class DbStepZerosControllerTest < ActionController::TestCase
  setup do
    @db_step_zero = db_step_zeros(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:db_step_zeros)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create db_step_zero" do
    assert_difference('DbStepZero.count') do
      post :create, :db_step_zero => @db_step_zero.attributes
    end

    assert_redirected_to db_step_zero_path(assigns(:db_step_zero))
  end

  test "should show db_step_zero" do
    get :show, :id => @db_step_zero.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @db_step_zero.to_param
    assert_response :success
  end

  test "should update db_step_zero" do
    put :update, :id => @db_step_zero.to_param, :db_step_zero => @db_step_zero.attributes
    assert_redirected_to db_step_zero_path(assigns(:db_step_zero))
  end

  test "should destroy db_step_zero" do
    assert_difference('DbStepZero.count', -1) do
      delete :destroy, :id => @db_step_zero.to_param
    end

    assert_redirected_to db_step_zeros_path
  end
end
