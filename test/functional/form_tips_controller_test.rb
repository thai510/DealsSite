require 'test_helper'

class FormTipsControllerTest < ActionController::TestCase
  setup do
    @form_tip = form_tips(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:form_tips)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create form_tip" do
    assert_difference('FormTip.count') do
      post :create, :form_tip => @form_tip.attributes
    end

    assert_redirected_to form_tip_path(assigns(:form_tip))
  end

  test "should show form_tip" do
    get :show, :id => @form_tip.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @form_tip.to_param
    assert_response :success
  end

  test "should update form_tip" do
    put :update, :id => @form_tip.to_param, :form_tip => @form_tip.attributes
    assert_redirected_to form_tip_path(assigns(:form_tip))
  end

  test "should destroy form_tip" do
    assert_difference('FormTip.count', -1) do
      delete :destroy, :id => @form_tip.to_param
    end

    assert_redirected_to form_tips_path
  end
end
