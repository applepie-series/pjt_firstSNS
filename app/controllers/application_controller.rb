class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ログイン後実行されるdeviseメソッド
  def after_sign_in_path_for(resource) 
    user = User.find_by(email: params[:session][:email].downcase)
    redirect_to user
  end
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:username, :email, :sex, :tel,  :password, :password_confirmation, :remember_me])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :username, :email, :password, :remember_me])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name,:username, :email, :sex, :tel, :web, :introduction, :password, :password_confirmation, :current_password])
    end

  private

    # ユーザーのログインを確認する
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "ログインして下さい。"
        redirect_to login_url
      end
    end
end