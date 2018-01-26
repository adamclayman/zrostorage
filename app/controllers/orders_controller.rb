class OrdersController < ApplicationController
#	before_action :authenticate_user!

	def index
		@orders = Order.includes(:product).all
	end

	def show
	    @order = Order.find(params[:id])
	end

	def new
	end

	def create
	end

	def destroy
		@order.destroy
		respond_to do |format|
			format.html { redirect_to orders_url, notice: "Order was successfully destroyed."}
			format.json { head :no_content}
		end
	end
end