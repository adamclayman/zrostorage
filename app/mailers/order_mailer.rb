class OrderMailer < ApplicationMailer
	default from: "adam@clayman.org"

	def order_form(email, name, message)
		@message = message
		mail(from: email,
			to: 'adam@clayman.org',
			subject: "A new order from #{name}")
	end
end
