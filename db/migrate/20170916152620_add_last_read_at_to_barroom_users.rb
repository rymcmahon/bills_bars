class AddLastReadAtToBarroomUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :barroom_users, :last_read_at, :datetime
  end
end
