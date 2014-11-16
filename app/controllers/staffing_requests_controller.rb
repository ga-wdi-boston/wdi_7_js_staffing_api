class StaffingRequestsController < ApplicationController
  # GET /staffing_requests
  # GET /staffing_requests.json
  def index
    @staffing_requests = StaffingRequest.all

    render json: @staffing_requests
  end

  # GET /staffing_requests/1
  # GET /staffing_requests/1.json
  def show
    @staffing_request = StaffingRequest.find(params[:id])

    render json: @staffing_request
  end

  # POST /staffing_requests
  # POST /staffing_requests.json
  def create
    @staffing_request = StaffingRequest.new(staffing_request_params)

    if @staffing_request.save
      render json: @staffing_request, status: :created, location: @staffing_request
    else
      render json: @staffing_request.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /staffing_requests/1
  # PATCH/PUT /staffing_requests/1.json
  def update
    @staffing_request = StaffingRequest.find(params[:id])

    if @staffing_request.update(staffing_request_params)
      head :no_content
    else
      render json: @staffing_request.errors, status: :unprocessable_entity
    end
  end

  # DELETE /staffing_requests/1
  # DELETE /staffing_requests/1.json
  def destroy
    @staffing_request = StaffingRequest.find(params[:id])
    @staffing_request.destroy

    head :no_content
  end

  private

    def staffing_request_params
      params.require(:staffing_request).permit(:percentage, :start_date, :end_date, :status, :title_id, :project_id)
    end
end
