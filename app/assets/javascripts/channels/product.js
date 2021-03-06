App.product = App.cable.subscriptions.create("ProductChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    $(".alert.alert-info").show()
    $('.product-reviews').prepend(data.comment)
    $('#average-rating').attr('data-score', data.average_rating)
    refreshRating();
    // Called when there's incoming data on the websocket for this channel
  },

  listen_to_comments: function() {
    let productId = $("[data-product-id]").data("product-id");
    if (productId) {
      return this.perform('listen', {
        product_id: productId
      });      
    }
  }
});

$(document).on('turbolinks:load', function() {
  App.product.listen_to_comments();
});