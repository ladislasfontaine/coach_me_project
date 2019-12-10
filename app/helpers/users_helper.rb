module UsersHelper
	def default_avatar(user)
		@avatar = user.avatar
		if @avatar.empty?
			@avatar_user = image_tag("defailt.jpg", alt: 'profile')
		else
			@avatar_user = image_tag(@avatar.url, alt: "profile")
		end
		return @avatar_user
	end
end
