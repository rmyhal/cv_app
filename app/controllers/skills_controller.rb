class SkillsController < ApplicationController
before_action :set_skill, only: [:update, :destroy]
before_action :set_resume

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(skill_params)
    @skill.resume_id = @resume.id

    if @skill.save
      flash[:notice] = "Skill created"
      redirect_to edit_resume_path(@resume)
    end
  end

  def update
    if @skill.update(skill_params)
      flash[:notice] = "Skill updated"
      redirect_to edit_resume_path(@resume)
    end
  end

  def destroy
    @skill.destroy
    flash[:notice] = "Skill was deleted"
    redirect_to edit_resume_path(@resume)
  end

  private

  def set_resume
    @resume = Resume.find(params[:resume_id])
  end

  def set_skill
    @skill = Skill.find(params[:id])
  end

  def skill_params
    params.require(:skill).permit(:section, :title, :percent)
  end
end
