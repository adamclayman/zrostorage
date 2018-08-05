class PaymentsController < ApplicationController
	def create
		@product = Product.find(params[:product_id])
		@user = current_user
		token = params[:stripeToken]
		begin
			charge = Stripe::Charge.create(
				amount: (@product.price * 100).to_i,
				currency: "usd",
				source: token,
				description: params[:stripeEmail],
				receipt_email: @user.email
			)

			if charge.paid
				Order.create(product_id: @product.id, user_id: current_user, total: @product.price)
				flash[:notice] = "Charge paid, and order successful."
				UserMailer.payment_confirmation(@user, @product).deliver_now
			end
	
		rescue Stripe::CardError => e
			# The card is declined
			body = e.json_body
			err = body[:error]
			flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
		end


		redirect_to product_path(@product)
	end
end


=begin
			product = Stripe::Product.create({
				name: @product.name
				type: 'service',
			})

			plan = Stripe::Plan.create({
				product: product, # product refers to the Stripe object here
				nickname: @product.name,
				interval: 'month',
				currency: 'usd',
				amount: @product.price,
			})

			customer = Stripe::Customer.create({
				email: @user.email,
				source: token,
			})

			subscription = Stripe::Subscription.create({
				customer: customer,
				items: [{plan: plan}],
			})
=end