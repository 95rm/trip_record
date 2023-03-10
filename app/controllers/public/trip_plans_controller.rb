class Public::TripPlansController < ApplicationController

  def new
    @trip_plan = TripPlan.new
  end

  def create
    @trip_plan = TripPlan.new(trip_plan_params)
    @trip_plan.user_id = current_user.id
    @tag_list = params[:trip_plan][:name_tag] #paramsでデータを
    if @trip_plan.save
      @trip_plan.save_tag(@tag_list) #save_tagはTripPlanモデルに記述している
    else
      render :new
    end
    redirect_to new_trip_plan_trip_plan_detail_path(@trip_plan)
  end

  def show
    @trip_plan = TripPlan.find(params[:id])
    #@trip_plan = @trip_plan.published  #投稿の公開・非公開機能実装コード
    @trip_plan_details = @trip_plan.trip_plan_details
    @total = 0
    @comment = Comment.new #コメント機能
    @comments = @trip_plan.comments #コメント機能

  end

  def research
    #ransackを使った検索機能実装
    @q = TripPlan.joins(:tags).distinct.ransack(params[:q])
    @trip_plans = @q.result
    @trip_plans = @trip_plans.where('name_tag like ?', "%#{params[:tag_name]}%") if params[:tag_name].present?
  end

  def edit
    @trip_plan = TripPlan.find(params[:id])
  end

  def update
    @trip_plan = TripPlan.find(params[:id]) #idで保存したいデータを呼び出す
    if @trip_plan.update(trip_plan_params) #trip_planのデータを保存する
      @trip_plan.save_tag(params[:trip_plan][:tag_list_to_s]) #タグのデータを保存する
      redirect_to trip_plan_path(@trip_plan.id) #showページに飛ぶ
    else
      render :edit
    end
  end

  def destroy
    @trip_plan = TripPlan.find(params[:id])
    @trip_plan.destroy
    redirect_to users_my_page_path
  end

  private
  def trip_plan_params
    params.require(:trip_plan).permit(:user_id, :title_name, :first_month, :first_day, :second_month, :second_day, :number_day, :budget, :status)
  end

end
