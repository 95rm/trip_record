class Public::CommentsController < ApplicationController

  def create
    @trip_plan = TripPlan.find(params[:trip_plan_id])
    @comment = current_user.comments.new(comment_params)
    @comment.trip_plan_id = @trip_plan.id
    if @comment.save
      flash[:notice] = "success"
      redirect_to trip_plan_path(@trip_plan.id)
    else
      @trip_plan_details = @trip_plan.trip_plan_details
      @total = 0
      @comments = @trip_plan.comments #コメント機能
      flash[:alert] = "failed"
      render 'public/trip_plans/show'
    end
  end

  def comment_params
    params.require(:comment).permit(:comment_content)
  end

end
