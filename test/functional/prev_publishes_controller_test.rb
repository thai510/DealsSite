require 'test_helper'

class PrevPublishesControllerTest < ActionController::TestCase
  setup do
    @prev_publish = prev_publishes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prev_publishes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prev_publish" do
    assert_difference('PrevPublish.count') do
      post :create, :prev_publish => @prev_publish.attributes
    end

    assert_redirected_to prev_publish_path(assigns(:prev_publish))
  end

  test "should show prev_publish" do
    get :show, :id => @prev_publish.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @prev_publish.to_param
    assert_response :success
  end

  test "should update prev_publish" do
    put :update, :id => @prev_publish.to_param, :prev_publish => @prev_publish.attributes
    assert_redirected_to prev_publish_path(assigns(:prev_publish))
  end

  test "should destroy prev_publish" do
    assert_difference('PrevPublish.count', -1) do
      delete :destroy, :id => @prev_publish.to_param
    end

    assert_redirected_to prev_publishes_path
  end
end
