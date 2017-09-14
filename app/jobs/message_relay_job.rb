class MessageRelayJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "barrooms:#{message.barroom.id}", {
      message: MessagesController.render(message),
      barroom_id: message.barroom.id
    }
  end
end
