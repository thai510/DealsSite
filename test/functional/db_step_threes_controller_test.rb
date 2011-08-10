require 'test_helper'

class DbStepThreesControllerTest < ActionController::TestCase
  setup do
    @db_step_three = db_step_threes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:db_step_threes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create db_step_three" do
    assert_difference('DbStepThree.count') do
      post :create, :db_step_three => @db_step_three.attributes
    end

    assert_redirected_to db_step_three_path(assigns(:db_step_three))
  end

  test "should show db_step_three" do
    get :show, :id => @db_step_three.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @db_step_three.to_param
    assert_response :success
  end

  test "should update db_step_three" do
    put :update, :id => @db_step_three.to_param, :db_step_three => @db_step_three.attributes
    assert_redirected_to db_step_three_path(assigns(:db_step_three))
  end

  test "should destroy db_step_three" do
    assert_difference('DbStepThree.count', -1) do
      delete :destroy, :id => @db_step_three.to_param
    end

    assert_redirected_to db_step_threes_path
  end
end
