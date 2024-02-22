class Artist < ApplicationRecord
  include DownloadSongs

  has_many :songs, -> { order(:title) }, dependent: :destroy
  has_many :downloads, dependent: :destroy

  scope :top, -> (letter, count) { joins(:songs, :downloads)
                                  .select('artists.id, artists.name as name, count(downloads.id) as downloads_count')
                                  .group('artists.id')
                                  .having('name like ?', "#{letter}%")
                                  .order('downloads_count desc').limit(count) }
  
  validates :name, presence: true
  
  def songs_top
    songs.joins(:downloads)
         .select('songs.id, songs.title as title, count(downloads.id) as downloads_count')
         .group('songs.id')
         .reorder('downloads_count desc')
  end
end
