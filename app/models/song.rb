class Song < ApplicationRecord
  belongs_to :artist

  has_many :downloads, dependent: :destroy
  
  scope :top, -> (days, count){ 
                                joins(:downloads)
                                .select('songs.*, count(downloads.id) as downloads_count ')
                                .group('songs.id')
                                .having('songs.created_at >= ?', days.days.ago)  
                                .order(downloads_count: :desc)                              
                                .limit(count) 
                              }

  validates :title, :artist_id, presence: true
end
 