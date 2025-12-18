module UsersHelper
  def avatar_url(user)
    if user.avatar.attached?
      url_for(user.avatar)
    else
      'default-avatar.png'
    end
  end
end
