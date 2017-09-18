handleVisibilityChange = ->
  if !document.hidden
    barroom_id = $("[data-behavior='messages']").data("barroom-id")
    App.last_read.update(barroom_id)

    true

$(document).on "turbolinks:load", ->
  $(document).on "visibilityChange", handleVisibilityChange

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
