class AddUrlToEntries < ActiveRecord::Migration[5.0]
  def change
    add_column :entries, :url, :string
  end
end
