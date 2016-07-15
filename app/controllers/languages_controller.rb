class LanguagesController < ApplicationController
  before_action :set_language, only: [:update, :destroy]
  before_action :set_resume

  def new
    @language = Language.new
  end

  def create
    @language = Language.new(language_params)
    @language.resume_id = @resume.id

    if @language.save
      flash[:notice] = "Language created"
      redirect_to edit_resume_path(@resume)
    end
  end

  def update
    if @language.update(language_params)
      flash[:notice] = "Language updated"
      redirect_to edit_resume_path(@resume)
    end
  end

  def destroy
    @language.destroy
    flash[:notice] = "Language was deleted"
    redirect_to edit_resume_path(@resume)
  end

  private

  def set_resume
    @resume = Resume.find(params[:resume_id])
  end

  def set_language
    @language = Language.find(params[:id])
  end

  def language_params
    params.require(:language).permit(:name, :level)
  end
end
