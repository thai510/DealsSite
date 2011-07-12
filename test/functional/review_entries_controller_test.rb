require 'test_helper'

class ReviewEntriesControllerTest < ActionController::TestCase
  setup do
    @review_entry = review_entries(:one)
    @update = { 
       :service =>    "service",
       :email =>     "email",
       :content =>     "content" }
    if session[:users_id]
      @logged_in = true
    else
      @logged_in = false
    end

  end
if @logged_in then
  test "should get index" do
    get :index
    if session[:users_id]
      assert_response :success
      assert_not_nil assigns(:review_entries)
    else
      assert_redirected_to home_path
    end
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create review_entry" do
    assert_difference('ReviewEntry.count') do
      post :create, :review_entry => @update
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
else
   test "logged out,index" do
    get :index
    assert_redirected_to home_path
  end

  test "logged out,new" do
    get :new
    assert_redirected_to home_path
  end


  #when review entries are added, need to add tests for
  #create,edit,show,update,destroy
  #when not logged in, all should redirect to home_path

end
end
