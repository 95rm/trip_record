class Public::UsersController < ApplicationController

  def index
    @user = User.all
    @trip_plans = @user.trip_plans
  end

  def user_params
    params.require(:user).permit(:account_name, :email, :encrypted_password, :is_deleted)
  end

end
