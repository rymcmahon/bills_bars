class Barroom < ApplicationRecord
  has_many :barroom_users
  has_many :users, through: :barroom_users
  has_many :messages
end
