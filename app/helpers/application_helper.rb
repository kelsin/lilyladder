module ApplicationHelper
  def admin?
    true
  end

  def current_user
    User.find_by_name('Kelsin')
  end
end
