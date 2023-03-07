class Public::TripPlansController < ApplicationController

  def new
    @trip_plan = TripPlan.new
  end

  def create
    @trip_plan = TripPlan.new(trip_plan_params)
    @trip_plan.user_id = current_user.id
    @trip_plan.save
    redirect_to new_trip_plan_trip_plan_detail_path(@trip_plan)
  end

  def show
    @trip_plan = TripPlan.find(params[:id])
    @trip_plan_detail = @trip_plan.trip_plan_details
    @total = 0
  end

  def research
    @q = TripPlan.ransack(params[:q])
  end

  private
  def trip_plan_params
    params.require(:trip_plan).permit(:user_id, :title_name, :first_month, :first_day, :second_month, :second_day, :number_day, :budget, :status)
  end

end
