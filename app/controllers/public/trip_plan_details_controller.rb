class Public::TripPlanDetailsController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update, :destroy]

  def new
    @trip_plan_detail = TripPlanDetail.new
  end

  def create
    @trip_plan_detail = TripPlanDetail.new(trip_plan_detail_params)
    @trip_plan_detail.trip_plan_id = params[:trip_plan_id]
    if @trip_plan_detail.save
      redirect_to  trip_plan_path(@trip_plan_detail.trip_plan_id)
    else
      render :new
    end
  end

  def edit
    @trip_plan_detail = TripPlanDetail.find(params[:id])
  end

  def update
    @trip_plan_detail = TripPlanDetail.find(params[:id])
    @trip_plan_detail.update(trip_plan_detail_params)
    redirect_to  trip_plan_path(@trip_plan_detail.trip_plan_id)
  end

  def destroy
    @trip_plan_detail = TripPlanDetail.find(params[:id])
    @trip_plan_detail.destroy
    redirect_to trip_plan_path(@trip_plan_detail.trip_plan_id)
  end

  private
  def trip_plan_detail_params
    params.require(:trip_plan_detail).permit(:trip_plan_id, :hour, :minute, :category, :what_day, :destination, :price)
  end

  def is_matching_login_user
    @trip_plan_detail = TripPlanDetail.find(params[:id])
    unless @trip_plan_detail.trip_plan.user.account_name == current_user.account_name
      redirect_to users_my_page_path
    end
  end

end
