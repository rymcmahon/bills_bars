class Message < ApplicationRecord
  belongs_to :barroom
  belongs_to :user
end
