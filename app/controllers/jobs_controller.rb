class JobsController < ApplicationController
  before_action :set_job, only: [:update, :destroy]
  before_action :set_resume

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to edit_resume_path(@resume)
    end
  end

  def update
    if @job.update(job_params)
    redirect_to edit_resume_path(@resume)
    end
  end

  def destroy
    @job.destroy
    redirect_to edit_resume_path(@resume)
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def set_resume
    @resume = Resume.find(params[:resume_id])
  end

  def job_params
    require(:job).permit(:date_from, :date_to, :firm, :position, :place)
  end
end
