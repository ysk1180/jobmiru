module SessionsHelper
  def current_user?(user, current_user)
    user == current_user
  end
end
