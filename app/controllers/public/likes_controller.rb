class Public::LikesController < ApplicationController

  def create
    @trip_plan = TripPlan.find(params[:trip_plan_id])
    @like = current_user.likes.new(trip_plan_id: @trip_plan.id)
    @like.save
    redirect_to trip_plan_path(@trip_plan.id)
  end

  def destroy
    @trip_plan = TripPlan.find(params[:trip_plan_id])
    @like = current_user.likes.find_by(trip_plan_id: @trip_plan.id)
    @like.destroy
    redirect_to trip_plan_path(@trip_plan.id)
  end

end
