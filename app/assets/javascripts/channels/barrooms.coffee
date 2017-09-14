App.barrooms = App.cable.subscriptions.create "BarroomsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    active_barroom = $("[data-behavior='messages'][data-barroom-id='#{data.barroom_id}']")
    if active_barroom.length > 0
      active_barroom.append(data.message)
    else
      $("[data-behavior='barroom-link'][data-barroom-id='#{data.barroom_id}']").css("font-weight", "bold")
