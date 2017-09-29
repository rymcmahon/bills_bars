class Barroom < ApplicationRecord
  has_many :barroom_users
  has_many :users, through: :barroom_users
  has_many :messages

  scope :public_channels, ->{ where(direct_message: false) }
  scope :direct_messages, ->{ where(direct_message: true) }

  def self.direct_message_for_users(users)
    users_ids = users.map(&:id).sort
    name = "DM:#{users_ids.join(":")}"

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
end
