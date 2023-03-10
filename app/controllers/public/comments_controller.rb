class Public::CommentsController < ApplicationController

  def create
    @trip_plan = TripPlan.find(params[:trip_plan_id])
    @comment = current_user.comments.new(comment_params)
    @comment.trip_plan_id = @trip_plan.id
    @comment.save
    redirect_to trip_plan_path(@trip_plan.id)
  end

  def comment_params
    params.require(:comment).permit(:comment_content)
  end

end
