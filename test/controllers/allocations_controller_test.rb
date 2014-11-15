require 'test_helper'

class AllocationsControllerTest < ActionController::TestCase
  setup do
    @allocation = allocations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:allocations)
  end

  test "should create allocation" do
    assert_difference('Allocation.count') do
      post :create, allocation: { end_date: @allocation.end_date, percentage: @allocation.percentage, project_id: @allocation.project_id, start_date: @allocation.start_date, user_id: @allocation.user_id }
    end

    assert_response 201
  end

  test "should show allocation" do
    get :show, id: @allocation
    assert_response :success
  end

  test "should update allocation" do
    put :update, id: @allocation, allocation: { end_date: @allocation.end_date, percentage: @allocation.percentage, project_id: @allocation.project_id, start_date: @allocation.start_date, user_id: @allocation.user_id }
    assert_response 204
  end

  test "should destroy allocation" do
    assert_difference('Allocation.count', -1) do
      delete :destroy, id: @allocation
    end

    assert_response 204
  end
end
