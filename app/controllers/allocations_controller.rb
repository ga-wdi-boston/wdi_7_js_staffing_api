class AllocationsController < ApplicationController
  # GET /allocations
  # GET /allocations.json
  def index
    @allocations = Allocation.all

    render json: @allocations
  end

  # GET /allocations/1
  # GET /allocations/1.json
  def show
    @allocation = Allocation.find(params[:id])

    render json: @allocation
  end

  # POST /allocations
  # POST /allocations.json
  def create
    @allocation = Allocation.new(allocation_params)

    if @allocation.save
      render json: @allocation, status: :created, location: @allocation
    else
      render json: @allocation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /allocations/1
  # PATCH/PUT /allocations/1.json
  def update
    @allocation = Allocation.find(params[:id])

    if @allocation.update(allocation_params)
      head :no_content
    else
      render json: @allocation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /allocations/1
  # DELETE /allocations/1.json
  def destroy
    @allocation = Allocation.find(params[:id])
    @allocation.destroy

    head :no_content
  end

  private

    def allocation_params
      params.require(:allocation).permit(:user_id, :staffing_request_id)
    end
end
