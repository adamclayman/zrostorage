if Rails.env.production?
	Rails.configuration.stripe = {
		publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
		secret_key: ENV['STRIPE_SECRET_KEY']
	}
else
	Rails.configuration.stripe = {
		publishable_key: 'pk_test_gTJ8yPfDGifM2W1ghv0tO7Qz',
		secret_key: 'sk_test_W1zjAQUasV3OO44GXzxSTfmr'
	}
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]