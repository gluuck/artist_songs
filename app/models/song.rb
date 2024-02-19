class Song < ApplicationRecord
  belongs_to :artist

  has_many :downloads, dependent: :destroy
  
  scope :top, -> (days, count){ where("created_at >= ?", days.days.ago)
                                .group(:id).order("SUM(downloads_count) DESC")
                                .limit(count) }

  validates :title, :artist_id, presence: true
end
 