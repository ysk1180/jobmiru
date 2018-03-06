class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    @user = User.from_omniauth(request.env["omniauth.auth"].except("extra"))
    if @user.persisted?
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, kind: "twitter") if is_navigational_format?
    else
      session["devise.user_attributes"] = @user.attributes
      redirect_to new_user_registration_url
    end
  end
end
