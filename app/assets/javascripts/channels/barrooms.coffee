App.barrooms = App.cable.subscriptions.create "BarroomsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Is user looking at the correct barroom that message came from?
    active_barroom = $("[data-behavior='messages'][data-barroom-id='#{data.barroom_id}']")
    if active_barroom.length > 0

      # Insert the message
      active_barroom.append("<div><strong>#{data.username}:</strong> #{data.body}</div>")

      if document.hidden
        # 1. Check if there is a divider on page
        # 2. If no divider, insert one
        if Notification.permission == "granted"
          new Notification(data.username, {body: data.body})

      else
        # 1. Send a notice to the server of the last_read_at timestamp

        # Insert the message
    else
      $("[data-behavior='barroom-link'][data-barroom-id='#{data.barroom_id}']").css("font-weight", "bold")

      send_message: (barroom_id, message) ->
        @perform "send_message", {barroom_id: barroom_id, body: message}
