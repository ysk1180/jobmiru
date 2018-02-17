class RegistrationsController < Devise::RegistrationsController
  protected
  def update_resource(resource, params)
    resource.update_without_password(params)
  end
  # 編集後のページ設定
  def after_update_path_for(resource)
    users_show_path(current_user.id)
  end
end
