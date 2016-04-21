class SchoolsController < ApplicationController
  def index
    @lat_lng = cookies[:lat_lng].split("|")
    if @lat_lng.nil?
      @user_coords = request.ip
      @schools = School.near(@user_coords, 10).paginate(page: params[:page], per_page: 9)
    else
      @schools = School.near(@lat_lng, 10).paginate(page: params[:page], per_page: 9)
    end
    
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)
    if @school.save
      redirect_to 'index' #using redirect_to forces rails to hit the index controller first. Render skips and just renders the view
    else
      redirect_to 'index'
    end
  end

  def edit
    @school = School.find_by(id: params[:id])
  end

  def update
    @school = School.find_by(id: params[:id])
    if @school.update_attributes(school_params)
      redirect_to @school
    else
      render 'edit'
    end
  end

  def show
    @school = School.find_by(id: params[:id])
  end

  private
  def school_params
    params.require(:school).permit(:name, :address, :fees, :reg_fees, :state)
  end
end
