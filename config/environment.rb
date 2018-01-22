# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
	address: 'smtp.sendgrid.net',
	port: '587',
	authentication: :plain,
	user_name: ENV['apikey'],
	password: ENV['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'],
	domain: 'heroku.com',
	enable_starttls_auto: true
}