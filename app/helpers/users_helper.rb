module UsersHelper

  def editable_by_user?(user, current_user)
    current_user == user || current_user.admin?
  end

  def get_current_user
    current_user ||= User.find_by(id: session[:user_id])
  end

  def has_incomplete_energy_app(user)
    search_string = "user_id = '%d' AND submission_date IS NULL" % [user[:id]]
    return EnergyApplication.where(search_string).order(submission_date: :desc) != nil
  end
end
