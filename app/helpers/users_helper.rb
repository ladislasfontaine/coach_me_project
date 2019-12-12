# frozen_string_literal: true

module UsersHelper
  def default_avatar(user)
    @avatar = user.avatar
    @avatar_user = if @avatar.empty?
                     image_tag('defailt.jpg', alt: 'profile')
                   else
                     image_tag(@avatar.url, alt: 'profile')
                   end
    @avatar_user
  end
end
