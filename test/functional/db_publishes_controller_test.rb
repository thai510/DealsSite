require 'test_helper'

class DbPublishesControllerTest < ActionController::TestCase
  setup do
    @db_publish = db_publishes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:db_publishes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create db_publish" do
    assert_difference('DbPublish.count') do
      post :create, :db_publish => @db_publish.attributes
    end

    assert_redirected_to db_publish_path(assigns(:db_publish))
  end

  test "should show db_publish" do
    get :show, :id => @db_publish.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @db_publish.to_param
    assert_response :success
  end

  test "should update db_publish" do
    put :update, :id => @db_publish.to_param, :db_publish => @db_publish.attributes
    assert_redirected_to db_publish_path(assigns(:db_publish))
  end

  test "should destroy db_publish" do
    assert_difference('DbPublish.count', -1) do
      delete :destroy, :id => @db_publish.to_param
    end

    assert_redirected_to db_publishes_path
  end
end
