class AddDirectMessageToBarrooms < ActiveRecord::Migration[5.1]
  def change
    add_column :barrooms, :direct_message, :boolean, default: false
  end
end
