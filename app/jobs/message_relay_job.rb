class MessageRelayJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "barrooms:#{message.barroom.id}", {
      username: message.user.username,
      body: message.body,
      barroom_id: message.barroom.id
    }
  end
end
