require 'test_helper'

class StaffingRequestsControllerTest < ActionController::TestCase
  setup do
    @staffing_request = staffing_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:staffing_requests)
  end

  test "should create staffing_request" do
    assert_difference('StaffingRequest.count') do
      post :create, staffing_request: { end_date: @staffing_request.end_date, percentage: @staffing_request.percentage, project_id: @staffing_request.project_id, start_date: @staffing_request.start_date, status: @staffing_request.status, title_id: @staffing_request.title_id }
    end

    assert_response 201
  end

  test "should show staffing_request" do
    get :show, id: @staffing_request
    assert_response :success
  end

  test "should update staffing_request" do
    put :update, id: @staffing_request, staffing_request: { end_date: @staffing_request.end_date, percentage: @staffing_request.percentage, project_id: @staffing_request.project_id, start_date: @staffing_request.start_date, status: @staffing_request.status, title_id: @staffing_request.title_id }
    assert_response 204
  end

  test "should destroy staffing_request" do
    assert_difference('StaffingRequest.count', -1) do
      delete :destroy, id: @staffing_request
    end

    assert_response 204
  end
end
