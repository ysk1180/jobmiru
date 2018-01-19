class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # name フィールドを許可する strong parameters の設定
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      # 画像投稿するために、user_imageカラムを許可
      devise_parameter_sanitizer.permit(:sign_up, keys: [:user_image])
    end
end
