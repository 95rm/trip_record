class Public::UsersController < ApplicationController

  def index
    @trip_plans = TripPlan.all
  end

  def show
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:account_name, :email, :encrypted_password, :is_deleted)
  end

end
