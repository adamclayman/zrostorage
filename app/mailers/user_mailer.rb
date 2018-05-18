class UserMailer < ApplicationMailer
	default from: "adam@clayman.org"

	def contact_form(email, name, message)
		@message = message
		mail(from: email,
			to: 'adam@clayman.org',
			subject: "A new contact form message from #{name}")
	end

	def welcome(user)
		@appname = "ZRO Storage"
		mail(to: user.email, subject: "Welcome to #{@appname}")
	end

	def payment_confirmation(user, product)
		@purchaser = user
		@product = product
		@appname = "ZRO Storage"
		mail(to: user.email, subject: "Payment Confirmation Notification, #{@appname}")
	end
end