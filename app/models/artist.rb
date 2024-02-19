class Artist < ApplicationRecord
  include DownloadSongs

  has_many :songs, -> { order(:title) }, dependent: :destroy
  has_many :downloads, dependent: :destroy

  scope :top, -> (letter, count) { where('name LIKE ?', "#{letter}%").order(:name).limit(count) }
  
  validates :name, presence: true

  def songs_top    
    Song.find_each(downloads_songs.map{|i| i[-1]}.sort.reverse.map{|s| downloads_songs.key(s)})
  end
end
