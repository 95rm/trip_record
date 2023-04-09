class Public::UsersController < ApplicationController
 before_action :set_user, only: [:show, :likes, :follows, :followers]
 before_action :set_current_user, only: [:edit, :update, :my_page, :withdraw]
 before_action :reject_deleted_user, only: [:show, :likes, :follows, :followers, :edit, :update, :my_page, :withdraw]

  def index
    @trip_plans = TripPlan.active_user_trips.published.page(params[:page]).per(8)
  end

  def show
    @trip_plans =  @user.trip_plans.page(params[:page]).per(8)
    @following_users = @user.following_users.actives
    @follower_users = @user.follower_users.actives
    #byebug
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to users_my_page_path
  end

  def my_page
    @trip_plans =  @user.trip_plans.page(params[:page]).per(8)
    @following_users = @user.following_users.actives
    @follower_users = @user.follower_users.actives
  end

  def likes
    @like_trip_plans = @user.like_trip_plans.active_user_trips.page(params[:page]).per(8)
  end

  def follows
    @following_users = @user.following_users.actives
  end

  def followers
    @follower_users = @user.follower_users.actives
  end

  def stop
  end

  #退会
  def withdraw
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end


  private
  def user_params
    params.require(:user).permit(:account_name, :email, :encrypted_password, :is_deleted)
  end

  #コントローラーの中でのみ使用するメソッドのためprivate以下に記述する
  def set_user
    @user = User.find(params[:id])
  end

  def set_current_user
    @user = current_user
  end

  def reject_deleted_user
    redirect_to root_url if @user.is_deleted?
  end
end
