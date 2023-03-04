class Public::UsersController < ApplicationController

  belongs_to :trip_plan_params
  belongs_to :like
  belongs_to :comment
  #belongs_to :フォロー機能のアソシエーション記述まだしてない

end
