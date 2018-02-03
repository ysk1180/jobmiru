class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # name フィールドを許可する strong parameters の設定
  before_action :configure_permitted_parameters, if: :devise_controller?

  # flashメッセージ表示設定
  add_flash_types :success, :info, :warning, :danger

  # ログイン後のページ設定
  def after_sign_in_path_for(resource)
    users_show_path(current_user.id)
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :age, :sex, :past_career, :career_plan, :email, :password, :password_confirmation, :user_image])

      # 編集時のストロングパラメータ設定
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :age, :sex, :past_career, :career_plan, :email, :password, :password_confirmation, :user_image])
    end

  # ログイン後のページ設定
  private
    def sign_in_required
      redirect_to new_user_session_url unless user_signed_in?
    end

end
