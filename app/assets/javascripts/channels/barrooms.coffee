App.barrooms = App.cable.subscriptions.create "BarroomsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    active_barroom = $("[data-behavior='messages'][data-barroom-id='#{data.barroom_id}']")
    if active_barroom.length > 0

      if document.hidden
        if $(".strike").length == 0
          active_barroom.append("<div class='strike'><span>Unread Meassages</span></div>")

        if Notification.permission == "granted"
          new Notification(data.username, {body: data.body})

      else
        App.last_read.update(data.barroom_id)

      active_barroom.append("<div><strong>#{data.username}:</strong> #{data.body}</div>")


    else
      $("[data-behavior='barroom-link'][data-barroom-id='#{data.barroom_id}']").css("font-weight", "bold")

      send_message: (barroom_id, message) ->
        @perform "send_message", {barroom_id: barroom_id, body: message}
