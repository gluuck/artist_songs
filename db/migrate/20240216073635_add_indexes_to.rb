class AddIndexesTo < ActiveRecord::Migration[7.0]
  def change
    add_index :artists, :name
    add_index :songs, :title
    add_index :downloads, :created_at
  end
end
