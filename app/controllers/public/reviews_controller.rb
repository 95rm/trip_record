class Public::ReviewsController < ApplicationController

  def show
    @review  = TripPlanDetail.find(params[:trip_plan_detail_id]).review
    @trip_plan_detail  = TripPlanDetail.find(params[:trip_plan_detail_id])
  end

  def create
    #byebug
    @review = Review.new(review_params)
    @review.trip_plan_detail_id = params[:trip_plan_detail_id]
    @trip_plan_detail = TripPlanDetail.find(params[:trip_plan_detail_id])
    if @review.save
      redirect_to trip_plan_detail_reviews_path
    else
      # @review.get_image(300,300)
      render :show
    end
  end

  def edit
   @review  = TripPlanDetail.find(params[:trip_plan_detail_id]).review
  end

  def update
    @review = TripPlanDetail.find(params[:trip_plan_detail_id]).review
    @review.update(review_params)
    redirect_to trip_plan_detail_reviews_path
  end

  private
  def review_params
    params.require(:review).permit(:trip_plan_detail_id, :review, :image)
  end

end
