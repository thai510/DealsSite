require 'test_helper'

class IncentiveIdeasControllerTest < ActionController::TestCase
  setup do
    @incentive_idea = incentive_ideas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:incentive_ideas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create incentive_idea" do
    assert_difference('IncentiveIdea.count') do
      post :create, :incentive_idea => @incentive_idea.attributes
    end

    assert_redirected_to incentive_idea_path(assigns(:incentive_idea))
  end

  test "should show incentive_idea" do
    get :show, :id => @incentive_idea.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @incentive_idea.to_param
    assert_response :success
  end

  test "should update incentive_idea" do
    put :update, :id => @incentive_idea.to_param, :incentive_idea => @incentive_idea.attributes
    assert_redirected_to incentive_idea_path(assigns(:incentive_idea))
  end

  test "should destroy incentive_idea" do
    assert_difference('IncentiveIdea.count', -1) do
      delete :destroy, :id => @incentive_idea.to_param
    end

    assert_redirected_to incentive_ideas_path
  end
end
