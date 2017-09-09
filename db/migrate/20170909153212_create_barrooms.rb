class CreateBarrooms < ActiveRecord::Migration[5.1]
  def change
    create_table :barrooms do |t|
      t.string :name

      t.timestamps
    end
  end
end
