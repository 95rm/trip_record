class Public::ReviewsController < ApplicationController

  def show
    @review  = TripPlanDetail.find(params[:trip_plan_detail_id]).review
  end

  def create
    @review = Review.new(review_params)
    @review.trip_plan_detail_id = @review.trip_plan_detail_id
    @review.save
    redirect_to trip_plan_detail_reviews_path
  end

  def edit
   @review  = TripPlanDetail.find(params[:trip_plan_detail_id]).review
  end

  def update

  end

  private
  def review_params
    params.require(:review).permit(:trip_plan_detail_id, :review, :image)
  end

end
