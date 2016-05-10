require 'will_paginate/array'
class SchoolsController < ApplicationController
  before_action :authenticate_user, only: [:new, :edit]
  #before_action :find_coordinates, only: :index
  def index
    # @lat_lng = cookies[:lat_lng].try(:split, "|") || request.ip
    # @schools = School.near(@lat_lng, 30).paginate(page: params[:page], per_page: 9)
   # @schools = School.all.paginate(page: params[:page], per_page: 10)

     @lat_lng = cookies[:lat_lng].try(:split, ",") || request.ip.split(",")
    if @lat_lng.nil?
      @user_coords = request.location
      @schools = School.near(@user_coords, 30).paginate(page: params[:page], per_page: 9)
    else
      @schools = School.near(@lat_lng, 30).paginate(page: params[:page], per_page: 9)
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
    if @school.reviews.blank? # checks if the school has any ratings, and if it doesn't, assign 0 to th average
      @average_review = 0
    else
     @average_review =  @school.reviews.average(:rating).round(2)
    end
  end

  #method to find top ranked school
  def schools_by_ranking
   # @schools = Review.select('reviews.id').joins('LEFT OUTER JOIN reviews ON (reviews.school_id = t2.school_id AND reviews.rating > t2.rating)').where('t2.school_id IS NULL')
   @schools = School.joins(:reviews).order('rating DESC').where('rating>3').to_a.uniq.paginate(page: params[:page], :per_page => 10)
   #use to_a before .uniq to avoid an error with postgres in production
  end

  private
  def school_params
    params.require(:school).permit(:name, :address, :fees, :reg_fees, :state)
  end

  def authenticate_user
    if !user_signed_in?
      redirect_to new_user_session_url
    end
  end

  def find_coordinates
    @lat_lng = cookies[:lat_lng].try(:split, "|")
    if @lat_lng.nil?
      @user_coords = request.location
      @schools = School.near(@user_coords, 30).paginate(page: params[:page], per_page: 9)
    else
      @schools = School.near(@lat_lng, 30).paginate(page: params[:page], per_page: 9)
    end

  end

end
