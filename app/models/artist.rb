class Artist < ApplicationRecord
  include DownloadSongs

  has_many :songs, -> { order(:title) }, dependent: :destroy
  has_many :downloads, dependent: :destroy

  scope :download_artists, -> { joins(:downloads).where.not(downloads: nil).distinct.map(&:downloads).flatten.map(&:artist_id).group_by(&:itself).transform_values(&:size).values }
  scope :top, -> (letter, count) { where('name LIKE ?', "#{letter}%") if download_artists.map{|x| x >= count} }

  def songs_top    
    Song.find(downloads_songs.map{|i| i[-1]}.sort.reverse.map{|s| downloads_songs.key(s)})
  end
end
