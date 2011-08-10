require 'test_helper'

class DbStepTwosControllerTest < ActionController::TestCase
  setup do
    @db_step_two = db_step_twos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:db_step_twos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create db_step_two" do
    assert_difference('DbStepTwo.count') do
      post :create, :db_step_two => @db_step_two.attributes
    end

    assert_redirected_to db_step_two_path(assigns(:db_step_two))
  end

  test "should show db_step_two" do
    get :show, :id => @db_step_two.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @db_step_two.to_param
    assert_response :success
  end

  test "should update db_step_two" do
    put :update, :id => @db_step_two.to_param, :db_step_two => @db_step_two.attributes
    assert_redirected_to db_step_two_path(assigns(:db_step_two))
  end

  test "should destroy db_step_two" do
    assert_difference('DbStepTwo.count', -1) do
      delete :destroy, :id => @db_step_two.to_param
    end

    assert_redirected_to db_step_twos_path
  end
end
