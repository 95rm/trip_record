class Public::TripPlanDetailsController < ApplicationController

  def new
    @trip_plan_detail = TripPlanDetail.new
  end

  def create
    @trip_plan_detail = TripPlanDetail.new(trip_plan_detail_params)
    @trip_plan_detail.trip_plan_id = params[:trip_plan_id]
    @trip_plan_detail.save
    redirect_to  trip_plan_path(@trip_plan_detail)
  end

  def index
    @trip_plan_detail = TripPlanDetail.find(params[:id])
  end

  private
  def trip_plan_detail_params
    params.require(:trip_plan_detail).permit(:trip_plan_id, :hour, :minute, :category, :what_day, :destination, :price)
  end

end
