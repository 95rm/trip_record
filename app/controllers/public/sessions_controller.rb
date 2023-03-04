# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  def after_sign_in_path_for(resource) #ログインした後のページ先設定
    users_my_page_path
  end

  def after_sign_out_path_for(resource) #ログアウトした後のページ先設定
    new_user_session_path
  end

  #以下ゲストログイン機能実装コード
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to users_my_page_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
