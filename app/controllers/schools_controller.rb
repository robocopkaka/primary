require 'will_paginate/array'
class SchoolsController < ApplicationController
  before_action :authenticate_user, only: [:new, :edit]
  #before_action :find_coordinates, only: :index
  def index
    #code to produce 9 random records pulled from http://blog.endpoint.com/2016/05/randomized-queries-in-ruby-on-rails.html?m=1
    desired_records = 9
    count= desired_records * 3
    offset = rand([School.count - count, 1].max)
    set = School.limit(count).offset(offset).pluck(:id)
    @schools = School.includes(:reviews).find(set.sample(desired_records)).paginate(page: params[:page], per_page:10)#includes uses eager loading to solve the N + ! queries problem, reducing number of 
    #queries to 4 including one query to find count, and one to finf AVERAGE
    #@schools = School.limit(9).order("RANDOM()").paginate(page: params[:page], per_page: 9)

    # @lat_lng = cookies[:lat_lng].try(:split, "|") || [request.location.latitude, request.location.longitude]
    # if @lat_lng.nil?
      
    #   @schools = School.all.paginate(page: params[:page], per_page: 9)
    # else
    #   @schools = School.near(@lat_lng, 30).paginate(page: params[:page], per_page: 9)
    # end
   # @schools = School.all.paginate(page: params[:page], per_page: 10)

  end

  def schools_near_you    
     @lat_lng ||= cookies[:lat_lng].try(:split, "|")  || request.location.coordinates
    
      @schools = School.near(@lat_lng, 30).paginate(page: params[:page], per_page: 9)
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)
    if @school.save
      redirect_to school_path(@school) #using redirect_to forces rails to hit the index controller first. Render skips and just renders the view
    else
      render 'new'
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
    @first_child_class = params[:class_id]
    @second_child_class = params[:second_id]
    @current_fees = 0
    calculate_all_fees
    #byebug
    #byebug
    if @school.reviews.blank? # checks if the school has any ratings, and if it doesn't, assign 0 to th average
      @average_review = 0
    else
     @average_review =  @school.reviews.average(:rating).round(2)
    end
  end

  def check
  end

  #method to find top ranked school
  def schools_by_ranking
   # @schools = Review.select('reviews.id').joins('LEFT OUTER JOIN reviews ON (reviews.school_id = t2.school_id AND reviews.rating > t2.rating)').where('t2.school_id IS NULL')
   @schools = School.joins(:reviews).select("schools.*, avg(reviews.rating) as average_rating").group("schools.id").order("average_rating DESC").paginate(page: params[:page], per_page:9) 
   #use to_a before .uniq to avoid an error with postgres in production
  end

  def find_by_price
    @schools = School.includes(:reviews).between(params[:price1], params[:price2]).paginate(page: params[:page], per_page:9)

  end

  def calculate_total_fees
    @school = School.find_by(id: params[:id])
     @available_class = params[:second_id]


    @current_fees = 0
    #first run to see if I can determine someone's school fees estimate for a particular class
    # if @available_class == "1"
    #   @current_fees = @school.primary_one + @school.primary_two + @school.primary_three + @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
    # elsif @available_class == "2"
    #   @current_fees = @school.primary_two + @school.primary_three + @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
    # elsif @available_class == "3"
    #   @current_fees = @school.primary_three + @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
    # elsif @available_class == "4"
    #    @current_fees = @school.primary_four + @school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
    # elsif @available_class == "5"
    #    @current_fees =@school.primary_five + @school.primary_six + @school.reg_fees + @school.exam_fees
    # elsif @available_class == "6"
    #    @current_fees = @school.primary_six + @school.reg_fees + @school.exam_fees
    # else

    # end
   
    
    #@current_fees = @school.primary_one + @school.primary_two + @school.primary_three + @school.primary_four + @school.primary_five + @school.primary_six
    # respond_to do |format|
    #     format.html{ render 'schools/calculate_total_fees' }
    #     format.js 
    # end
  end

  private
  def school_params
    params.require(:school).permit(:name, :address, :fees, :reg_fees, :state, :image)
  end

  def authenticate_user
    if !user_signed_in?
      redirect_to new_user_session_url
    end
  end

  def find_coordinates
    @lat_lng = cookies[:lat_lng].try(:split, "|")
    if @lat_lng.nil?
      @user_coords = request.location.coordinates
      @schools = School.near(@user_coords, 30).paginate(page: params[:page], per_page: 9)
    else
      @schools = School.near(@lat_lng, 30).paginate(page: params[:page], per_page: 9)
    end

  end

end
