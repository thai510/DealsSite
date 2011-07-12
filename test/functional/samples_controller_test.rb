require 'test_helper'

class SamplesControllerTest < ActionController::TestCase
  setup do
    @sample = samples(:one)
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
    assert_not_nil assigns(:samples)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sample" do
    assert_difference('Sample.count') do
      post :create, :sample => @sample.attributes
    end

    assert_redirected_to sample_path(assigns(:sample))
  end

  test "should show sample" do
    get :show, :id => @sample.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @sample.to_param
    assert_response :success
  end

  test "should update sample" do
    put :update, :id => @sample.to_param, :sample => @sample.attributes
    assert_redirected_to sample_path(assigns(:sample))
  end

  test "should destroy sample" do
    assert_difference('Sample.count', -1) do
      delete :destroy, :id => @sample.to_param
    end

    assert_redirected_to samples_path
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


  #when samples are added, need to add tests for
  #create,edit,show,update,destroy
  #when not logged in, all should redirect to home_path

end
end
