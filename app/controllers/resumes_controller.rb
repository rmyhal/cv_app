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
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
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
