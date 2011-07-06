require 'test_helper'

class ReviewEntriesControllerTest < ActionController::TestCase
  setup do
    @review_entry = review_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:review_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create review_entry" do
    assert_difference('ReviewEntry.count') do
      post :create, :review_entry => @review_entry.attributes
    end

    assert_redirected_to review_entry_path(assigns(:review_entry))
  end

  test "should show review_entry" do
    get :show, :id => @review_entry.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @review_entry.to_param
    assert_response :success
  end

  test "should update review_entry" do
    put :update, :id => @review_entry.to_param, :review_entry => @review_entry.attributes
    assert_redirected_to review_entry_path(assigns(:review_entry))
  end

  test "should destroy review_entry" do
    assert_difference('ReviewEntry.count', -1) do
      delete :destroy, :id => @review_entry.to_param
    end

    assert_redirected_to review_entries_path
  end
end
