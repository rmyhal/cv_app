class InterestsController < ApplicationController
  before_action :set_interest, only: [:update, :destroy]
  before_action :set_resume

  def new
    @interest = Interest.new
  end

  def create
    @interest = Interest.new(interest_params)
    @interest.resume_id = @resume.id

    if @interest.save
    redirect_to edit_resume_path(@resume)
      end
  end

  def update
    if @interest.update(interest_params)
      redirect_to edit_resume_path(@resume)
    end
  end

  def destroy
    @interest.destroy
    redirect_to edit_resume_path(@resume)
  end

  private
  def set_interest
    @interest = Interest.find(params[:id])
  end

  def set_resume
    @resume = Resume.find(params[:resume_id])
  end

  def interest_params
    require(:interest).permit(:name)
  end

end
