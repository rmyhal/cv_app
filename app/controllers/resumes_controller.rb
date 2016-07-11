class ResumesController < ApplicationController
  def index
    @resumes = Resume.all
  end
  def show
    @resume = Resume.find(params[:id])
  end
  def new
    @resume = Resume.new
  end
  def edit
    @resume = Resume.find(params[:id])
  end
  def create
    @resume = Resume.new(resume_params)

    if @resume.save
      redirect_to resumes_path
    else
      render 'new'
      end
  end
  def update
    @resume = Resume.find(params[:id])

    if @resume.update(resume_params)
      redirect_to @resume
    else
      render 'edit'
    end
  end
  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy
    redirect_to resumes_path
  end


  private
  def resume_params
    params.require(:resume).permit(:name, :general_info, :avatar)
  end
end
