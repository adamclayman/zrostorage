class ProductChannel < ApplicationCable::Channel
  def subscribed
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def listen
  	data["product_id"] = @product.id # Not sure if this is correct...
  	stop_all_streams
  	stream_for data["product_id"]
  end

  $(document).on('turbolinks:load', function(){
  		App.product.listen_to_comments();
  	});
end
