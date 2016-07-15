class ProjectsController < ApplicationController
  before_action :set_project, only: [:update, :destroy]
  before_action :set_resume

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.resume_id = @resume.id

    if @project.save
      flash[:notice] = "Project created"
      redirect_to edit_resume_path(@resume)
    end
  end

  def update
    if @project.update(project_params)
      flash[:notice] = "Project updated"
      redirect_to edit_resume_path(@resume)
    end
  end

  def destroy
    @project.destroy
    flash[:notice] = "Project was deleted"
    redirect_to edit_resume_path(@resume)
  end

  private

  def set_resume
    @resume = Resume.find(params[:resume_id])
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:date_from, :date_to, :client, :description, :technologies, :role)
  end
end
