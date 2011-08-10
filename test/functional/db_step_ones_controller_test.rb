require 'test_helper'

class DbStepOnesControllerTest < ActionController::TestCase
  setup do
    @db_step_one = db_step_ones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:db_step_ones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create db_step_one" do
    assert_difference('DbStepOne.count') do
      post :create, :db_step_one => @db_step_one.attributes
    end

    assert_redirected_to db_step_one_path(assigns(:db_step_one))
  end

  test "should show db_step_one" do
    get :show, :id => @db_step_one.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @db_step_one.to_param
    assert_response :success
  end

  test "should update db_step_one" do
    put :update, :id => @db_step_one.to_param, :db_step_one => @db_step_one.attributes
    assert_redirected_to db_step_one_path(assigns(:db_step_one))
  end

  test "should destroy db_step_one" do
    assert_difference('DbStepOne.count', -1) do
      delete :destroy, :id => @db_step_one.to_param
    end

    assert_redirected_to db_step_ones_path
  end
end
