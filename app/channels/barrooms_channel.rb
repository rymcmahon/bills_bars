class BarroomsChannel < ApplicationCable::Channel
  def subscribed
    current_user.barrooms.each do |barroom|
      stream_from "barrooms:#{barroom.id}"
    end
  end

  def unsubscribed
    stop_all_streams
  end

  def send_message(data)
    @barroom = Barroom.find(data["barroom_id"])
    message = @barroom.messages.create(body: data["body"], user: current_user)
    MessageRelayJob.perform_later(message)
  end
end
