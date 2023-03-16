class Public::UsersController < ApplicationController

  def index
    @trip_plans = TripPlan.published
  end

  def show
    @user = User.find(params[:id])
    @trip_plans =  @user.trip_plans
    #byebug
  end

  def my_page
    @user = current_user
    @trip_plans =  @user.trip_plans
  end

  def likes
    @user = User.find(params[:id])
    @likes = Like.where(user_id: @user.id).pluck(:trip_plan_id)
    @like_trip_plan = TripPlan.find(@likes)
  end


  private
  def user_params
    params.require(:user).permit(:account_name, :email, :encrypted_password, :is_deleted)
  end

end
