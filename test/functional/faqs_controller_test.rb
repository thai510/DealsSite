require 'test_helper'

class FaqsControllerTest < ActionController::TestCase
  setup do
    @faq = faqs(:one)

    if session[:users_id]
      @logged_in = true
    else
      @logged_in = false
    end

  end
if @logged_in then
  test "should get index" do
    get :index
      assert_response :success
      assert_not_nil assigns(:faqs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create faq" do
    assert_difference('Faq.count') do
      post :create, :faq => @faq.attributes
    end

    assert_redirected_to faq_path(assigns(:faq))
  end

  test "should show faq" do
    get :show, :id => @faq.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @faq.to_param
    assert_response :success
  end

  test "should update faq" do
    put :update, :id => @faq.to_param, :faq => @faq.attributes
    assert_redirected_to faq_path(assigns(:faq))
  end

  test "should destroy faq" do
    assert_difference('Faq.count', -1) do
      delete :destroy, :id => @faq.to_param
    end

    assert_redirected_to faqs_path
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


  #when faqs are added, need to add tests for
  #create,edit,show,update,destroy
  #when not logged in, all should redirect to home_path

end
end
