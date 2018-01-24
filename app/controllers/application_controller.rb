class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # name フィールドを許可する strong parameters の設定
  before_action :configure_permitted_parameters, if: :devise_controller?

  # flashメッセージ表示設定
  add_flash_types :success, :info, :warning, :danger
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:age])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:sex])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:past_career])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:career_plan])
      # 画像投稿するために、user_imageカラムを許可
      devise_parameter_sanitizer.permit(:sign_up, keys: [:user_image])
    end
end
