class ResumesController < ApplicationController

  http_basic_authenticate_with name: 'everUser', password: 's31415926', except: :show

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

    flash[:notice] = "Resume created"
    if @resume.save
      redirect_to resume_path(@resume)
    else
      render 'new'
      end
  end
  def update
    @resume = Resume.find(params[:id])

    if @resume.update(resume_params)
      flash[:notice] = "Resume updated"
      redirect_to resume_path(@resume)
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
    params.require(:resume).permit(:name, :general_info, :interests, :avatar,
                                   skills_attributes: [:id, :section, :title, :percent, :color, :_destroy],
                                   languages_attributes: [:id, :name, :level, :_destroy],
                                   projects_attributes:[:id, :date_from, :date_to, :client, :description, :technologies, :role, :_destroy],
                                   educations_attributes:[:id, :date_from, :date_to, :level, :description, :place, :_destroy],
                                   jobs_attributes:[:id, :date_from, :date_to, :firm, :position, :place, :_destroy])
  end
end
