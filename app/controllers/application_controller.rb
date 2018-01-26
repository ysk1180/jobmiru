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
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:password])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:password_confirmation])

      # 画像投稿するために、user_imageカラムを許可
      devise_parameter_sanitizer.permit(:sign_up, keys: [:user_image])

      # 編集時のストロングパラメータ設定
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:age])
      devise_parameter_sanitizer.permit(:account_update, keys: [:sex])
      devise_parameter_sanitizer.permit(:account_update, keys: [:past_career])
      devise_parameter_sanitizer.permit(:account_update, keys: [:career_plan])
      devise_parameter_sanitizer.permit(:account_update, keys: [:email])
      devise_parameter_sanitizer.permit(:account_update, keys: [:password])
      devise_parameter_sanitizer.permit(:account_update, keys: [:password_confirmation])
      devise_parameter_sanitizer.permit(:account_update, keys: [:user_image])
    end
end
