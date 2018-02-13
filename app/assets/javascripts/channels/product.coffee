App.product = App.cable.subscriptions.create "ProductChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
  	$(".alert.alert-info").show()
  	$('.product-reviews').prepend(data.comment)
  	$('#average-rating').attr('data-score', data.average_rating)
    # Called when there's incoming data on the websocket for this channel

  listen_to_comments: (data) ->
  	return this.perform('listen', {
  		product_id: $("[data-product-id]").data("product-id")
  	});

 `$(document).on('turbolinks:load', function() {
  		App.product.listen_to_comments();
  	});` 