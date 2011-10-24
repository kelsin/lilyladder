module UsersHelper
  def bnet_id(user)
    if user.bnet_id
      user.bnet_id
    else
      content_tag(:em, 'Unset')
    end
  end
end
