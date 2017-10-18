class AddEntryIdToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :entry_id, :string
  end
end
