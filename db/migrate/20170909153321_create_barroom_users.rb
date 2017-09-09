class CreateBarroomUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :barroom_users do |t|
      t.references :barroom, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
