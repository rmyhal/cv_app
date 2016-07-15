class EducationsController < ApplicationController
  before_action :set_education, only: [:update, :destroy]
  before_action :set_resume

  def new
    @education = Education.new
  end

  def create
    @education = Education.new(education_params)
    @education.resume_id = @resume.id
    if @education.save
      redirect_to edit_resume_path(@resume)
    end
  end

  def update
    if @education.update(education_params)
      redirect_to edit_resume_path(@resume)
    end
  end

  def destroy
    @education.destroy
    redirect_to edit_resume_path(@resume)
  end

  private

  def set_education
    @education = Education.find(params[:id])
  end

  def set_resume
    @resume = Resume.find(params[:resume_id])
  end

  def education_params
    require(:education).permit(:date_from, :date_to, :level, :description, :place)
  end

end
