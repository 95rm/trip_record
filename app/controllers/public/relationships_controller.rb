class Public::RelationshipsController < ApplicationController

  def create
   current_user.follow(params[:user_id])#relationshipのモデルにfollowは定義している
   redirect_to request.referer
  end

  def destroy
   current_user.unfollow(params[:user_id])#relationshipのモデルにunfollowは定義している
   redirect_to request.referer
  end

end
