module ApplicationHelper
  def admin?
    current_user and current_user.admin?
  end

  def current_user
    User.find_by_name('Kelsin')
  end
end
