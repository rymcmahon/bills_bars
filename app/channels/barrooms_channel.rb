class BarroomsChannel < ApplicationCable::Channel
  def subscribed
    current_user.barrooms.each do |barroom|
      stream_from "barroom:#{barroom.id}"
    end
  end

  def unsubscribed
    stop_all_streams
  end
end
