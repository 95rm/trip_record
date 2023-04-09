class Public::TripPlansController < ApplicationController
  before_action :reject_deleted_users_plan, only: [:show, :edit, :update, :destroy]
  before_action :is_matching_login_user, only: [:edit, :update]

  def new
    @trip_plan = TripPlan.new
  end

  def create
    @trip_plan = TripPlan.new(trip_plan_params)
    @trip_plan.user_id = current_user.id
    @tag_list = params[:trip_plan][:name_tag] #paramsでデータを
    if @trip_plan.save
      @trip_plan.save_tag(@tag_list) #save_tagはTripPlanモデルに記述している
      redirect_to new_trip_plan_trip_plan_detail_path(@trip_plan)
    else
      render :new
    end
  end

  def show
    if @trip_plan.user_id != current_user.id && !@trip_plan.status
      redirect_to users_my_page_path
      return
    end
    @trip_plan_details = @trip_plan.trip_plan_details.order(what_day: 'ASC').order(hour: 'ASC')#日にち順＆時間順に表示
    @user = @trip_plan.user
    @comment = Comment.new #コメント機能
    @comments = @trip_plan.comments #コメント機能
  end

  def research
    #ransackを使った検索機能実装
    @q = TripPlan.left_joins(:tags).joins(:user).where(user: { is_deleted: false }).where(status: true).distinct.ransack(params[:q])
    @trip_plans = @q.result
    @trip_plans = @trip_plans.where('name_tag like ?', "%#{params[:tag_name]}%") if params[:tag_name].present?
  end

  def edit
  end

  def update
    if @trip_plan.update(trip_plan_params) #trip_planのデータを保存する
      if params[:trip_plan][:tag_list_to_s]
        @trip_plan.save_tag(params[:trip_plan][:tag_list_to_s]) #タグのデータを保存する
      end
      redirect_to trip_plan_path(@trip_plan.id) #showページに飛ぶ
    else
      render :edit
    end
  end

  def destroy
    @trip_plan.destroy
    redirect_to users_my_page_path
  end

  private
  def trip_plan_params
    params.require(:trip_plan).permit(:user_id, :title_name, :first_month, :first_day, :second_month, :second_day, :number_day, :budget, :status)
  end

#コントローラーの中でのみ使用するメソッドのためprivate以下に記述する
  def reject_deleted_users_plan
    @trip_plan = TripPlan.find(params[:id])
    redirect_to root_url if @trip_plan.user.is_deleted?
  end

  def is_matching_login_user
    @trip_plan = TripPlan.find(params[:id])
    unless @trip_plan.user.account_name == current_user.account_name
      redirect_to users_my_page_path
    end
  end

end
