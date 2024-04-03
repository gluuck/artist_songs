class AddIndexesToSongs < ActiveRecord::Migration[7.0]
  def change
    add_index :songs, [:artist_id, :downloads_count], unique: true
  end
end
