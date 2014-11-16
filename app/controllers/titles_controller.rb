class TitlesController < ApplicationController
  # GET /titles
  # GET /titles.json
  def index
    @titles = Title.all

    render json: @titles
  end

  # GET /titles/1
  # GET /titles/1.json
  def show
    @title = Title.find(params[:id])

    render json: @title
  end

  # POST /titles
  # POST /titles.json
  def create
    @title = Title.new(title_params)

    if @title.save
      render json: @title, status: :created, location: @title
    else
      render json: @title.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /titles/1
  # PATCH/PUT /titles/1.json
  def update
    @title = Title.find(params[:id])

    if @title.update(title_params)
      head :no_content
    else
      render json: @title.errors, status: :unprocessable_entity
    end
  end

  # DELETE /titles/1
  # DELETE /titles/1.json
  def destroy
    @title = Title.find(params[:id])
    @title.destroy

    head :no_content
  end

  private

    def title_params
      params.require(:title).permit(:name, :staffing_requests)
    end
end
