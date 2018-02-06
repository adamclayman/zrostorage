class PaymentsController < ApplicationController
	def create
		@product = params[:product_id]
		@user = current_user
		token = params[:stripeToken]
		begin
			charge = Stripe::Charge.create(
				amount: @product.price, # Requires decimal round care and attention
				currency: "usd",
				source: token,
				description: params[:stripeEmail],
				receipt_email: @user.email
			)

			if charge.paid
				Order.create(product_id: @product.id, user_id: current_user, total: @product.price)
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
