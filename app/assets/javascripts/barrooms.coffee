handleVisibilityChange = ->
  $strike = $(".strike")
  if $strike.length > 0
    barroom_id = $("[data-behavior='messages']").data("barroom-id")
    App.last_read.update(barroom_id)
    $strike.remove()

$(document).on "turbolinks:load", ->
  $(document).on "click", handleVisibilityChange

  $("#new_message").on "keypress", (e) ->
    if e && e.keyCode == 13
      e.preventDefault()
      $(this).submit()

$("#new_message").on "submit", (e) ->
    e.preventDefault()

    barroom_id = $("[data-behavior='messages']").data("barroom-id")
    body        = $("#message_body")

    App.barrooms.send_message(barroom_id, body.val())

    body.val("")