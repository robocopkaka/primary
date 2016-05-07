class ReviewsController < ApplicationController
	before_action :find_school
	before_action :find_review, only: [:edit, :update, :destroy]
	before_action :authenticate_user, only: [:new, :edit]
	def new
		@review = Review.new
	end

	def create
		@review = Review.new(review_params)
		@review.school_id = @school.id #helps save to the reviews table, since we aren't using .build I guess 
		@review.user_id = current_user.id #helps save to the reviews table, since we aren't using .build I guess

		if @review.save
			redirect_to school_path(@school)
		else
			render 'new'
		end
	end

	def edit
	end

	def update

		if @review.update_attributes(review_params)
			redirect_to school_path(@school)
		else
			render 'edit'
		end
	end

	def destroy
		@review.destroy
		redirect_to school_path(@school)
	end

	private

	def review_params
		params.require(:review).permit(:rating, :comment)
	end

	#used to help refactor code. So instead of defining @review = Review.find(params[:id]) in diff methods, we do this once, and use before_action to specify which methods will call it
	def find_review
		@review = Review.find(params[:id])
	end

	#used to help refactor code. So instead of defining @school = School.find(params[:id]) in diff methods, we do this once, and use before_action to specify which methods will call it
	def find_school
		@school = School.find(params[:school_id])
	end

    def authenticate_user
   	 if !user_signed_in?
      redirect_to new_user_session_url
     end
  	end
end
