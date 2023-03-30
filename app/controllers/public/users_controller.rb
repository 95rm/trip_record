class Public::UsersController < ApplicationController

  def index
    @trip_plans = TripPlan.published.page(params[:page]).per(7)
  end

  def show
    @user = User.find(params[:id])
    @trip_plans =  @user.trip_plans
    #byebug
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to users_my_page_path
  end

  def my_page
    @user = current_user
    @trip_plans =  @user.trip_plans.page(params[:page]).per(15)
  end

  def likes
    @user = User.find(params[:id])
    @likes = Like.where(user_id: @user.id).pluck(:trip_plan_id)
    @like_trip_plan = TripPlan.find(@likes)
  end

  def follows
    @user = User.find(params[:id])
  end

  def followers
    @user = User.find(params[:id])
  end

  def stop
  end

  #退会
  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end


  private
  def user_params
    params.require(:user).permit(:account_name, :email, :encrypted_password, :is_deleted)
  end

end
