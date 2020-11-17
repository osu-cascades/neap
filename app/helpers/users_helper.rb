module UsersHelper

  def editable_by_user?(user, current_user)
    current_user == user || current_user.admin?
  end

  def get_current_user
    current_user ||= User.find_by(id: session[:user_id])
  end
end
