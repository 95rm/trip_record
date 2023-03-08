class Public::UsersController < ApplicationController

  def index
    @trip_plans = TripPlan.all
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

  def user_params
    params.require(:user).permit(:account_name, :email, :encrypted_password, :is_deleted)
  end

end
