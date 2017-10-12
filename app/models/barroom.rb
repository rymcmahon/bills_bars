class Barroom < ApplicationRecord
  has_many :barroom_users, dependent: :destroy
  has_many :users, through: :barroom_users
  has_many :messages, dependent: :destroy

  scope :public_channels, ->{ where(direct_message: false) }
  scope :direct_messages, ->{ where(direct_message: true) }

  def self.direct_message_for_users(users)
    user_ids = users.map(&:id).sort
    name = "DM:#{user_ids.join(":")}"

    if barroom = direct_messages.where(name: name).first
      barroom
    else
      #create new barroom
      barroom = new(name: name, direct_message: true)
      barroom.users = users
      barroom.save
      barroom
    end
  end

  def self.unjoined_room(user, barroom)
    BarroomUser.where("user_id = ? AND barroom_id = ?", user, barroom)
  end

end
