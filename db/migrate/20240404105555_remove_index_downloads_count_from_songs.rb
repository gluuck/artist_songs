class RemoveIndexDownloadsCountFromSongs < ActiveRecord::Migration[7.0]
  def change
    remove_index :songs, :downloads_count
  end
end
