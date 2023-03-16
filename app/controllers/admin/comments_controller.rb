class Admin::CommentsController < ApplicationController

  def index
    @comment = Comment.all
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to admin_comments_path
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :comment_content)
  end

end