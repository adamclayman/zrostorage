App.product = App.cable.subscriptions.create "ProductChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
  	$(".alert.alert-info").show()
  	console.log(data.comment.body)
    # Called when there's incoming data on the websocket for this channel

  listen_to_comments: ->
  	return this.perform('listen', {
  		product_id: $("[data-product-id]").data("product-id")
  	});