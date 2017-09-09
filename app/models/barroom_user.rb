class BarroomUser < ApplicationRecord
  belongs_to :barroom
  belongs_to :user
end
