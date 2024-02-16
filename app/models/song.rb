class Song < ApplicationRecord
  belongs_to :artist

  has_many :downloads, dependent: :destroy

  scope :top, -> (days, count) { 
    joins(:downloads)
      .where(downloads: { created_at: "#{days.days.ago}"..Time.now })
      .limit(count) 
    }
end
 