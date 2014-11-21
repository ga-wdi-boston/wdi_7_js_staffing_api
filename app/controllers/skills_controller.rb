class SkillsController < ApplicationController
  before_filter :authenticate

  # GET /skills
  # GET /skills.json
  def index
    @skills = Skill.all
    
    render json: @skills
  end

  # GET /skills/1
  # GET /skills/1.json
  def show
    @skill = Skill.find(params[:id])

    render json: @skill
  end

  # POST /skills
  # POST /skills.json
  def create
    @skill = Skill.new(skill_params)

    if @skill.save
      render json: @skill, status: :created, location: @skill
    else
      render json: @skill.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /skills/1
  # PATCH/PUT /skills/1.json
  # PATCH/PUT /users/1/skills/1
  # PATCH/PUT /users/1/skills/1.json
  def update
    @skill = Skill.find(params[:id])

    if params[:user_id]
      user = User.find(params[:user_id])

      user.skills << @skill
      
      head :no_content
    else
      if @skill.update(skill_params)
        head :no_content
      else
        render json: @skill.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /skills/1
  # DELETE /skills/1.json
  # DELETE /users/1/skills/1
  # DELETE /users/1/skills/1.json
  def destroy
    @skill = Skill.find(params[:id])

    if params[:user_id]
      user = User.find(params[:user_id])

      user.skills.delete(@skill)
    else
      @skill.destroy
    end

    head :no_content
  end

  private

    def skill_params
      params.require(:skill).permit(:name, :user_id)
    end
end
