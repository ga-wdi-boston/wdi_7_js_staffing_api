require 'test_helper'

class TitlesControllerTest < ActionController::TestCase
  setup do
    @title = titles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:titles)
  end

  test "should create title" do
    assert_difference('Title.count') do
      post :create, title: { name: @title.name, staffing_requests: @title.staffing_requests }
    end

    assert_response 201
  end

  test "should show title" do
    get :show, id: @title
    assert_response :success
  end

  test "should update title" do
    put :update, id: @title, title: { name: @title.name, staffing_requests: @title.staffing_requests }
    assert_response 204
  end

  test "should destroy title" do
    assert_difference('Title.count', -1) do
      delete :destroy, id: @title
    end

    assert_response 204
  end
end
