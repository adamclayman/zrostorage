class UserMailer < ApplicationMailer
	default from: "zrostorage@clayman.org"

	def contact_form(email, name, message)
		@message = message
		mail(from: email,
			to: 'zrostorage@clayman.org',
			subject: "A new contact form message from #{name}")
	end

	def welcome(user)
		@appname = "ZRO Storage"
		mail(to: user.email, subject: "Welcome to #{@appname}")
	end
end