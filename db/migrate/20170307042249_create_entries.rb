class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.string :title
      t.string :image
      t.text :summary
      t.datetime :published
      t.integer :feed_id

      t.timestamps
    end
  end
end
