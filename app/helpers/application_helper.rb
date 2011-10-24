module ApplicationHelper
  def admin?
    current_user and current_user.admin?
  end

  def can_edit_match?(match)
    admin? or match.users.include? current_user
  end

  def current_user
    User.find_by_name('Kelsin')
  end
end
