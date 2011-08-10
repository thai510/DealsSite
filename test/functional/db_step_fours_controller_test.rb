require 'test_helper'

class DbStepFoursControllerTest < ActionController::TestCase
  setup do
    @db_step_four = db_step_fours(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:db_step_fours)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create db_step_four" do
    assert_difference('DbStepFour.count') do
      post :create, :db_step_four => @db_step_four.attributes
    end

    assert_redirected_to db_step_four_path(assigns(:db_step_four))
  end

  test "should show db_step_four" do
    get :show, :id => @db_step_four.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @db_step_four.to_param
    assert_response :success
  end

  test "should update db_step_four" do
    put :update, :id => @db_step_four.to_param, :db_step_four => @db_step_four.attributes
    assert_redirected_to db_step_four_path(assigns(:db_step_four))
  end

  test "should destroy db_step_four" do
    assert_difference('DbStepFour.count', -1) do
      delete :destroy, :id => @db_step_four.to_param
    end

    assert_redirected_to db_step_fours_path
  end
end
