class LastReadChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def update(data)
    barroom_user = current_user.barroom_users.find_by(barroom_id: data["barroom_id"])
    barroom_user.update(last_read_at: Time.zone.now)
  end
end
