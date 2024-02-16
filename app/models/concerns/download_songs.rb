module DownloadSongs
  extend ActiveSupport::Concern

  included do
    has_many :downloads, dependent: :destroy
  end

  def downloads_songs
    @downloads_songs ||= downloads.pluck(:song_id).group_by(&:itself).transform_values(&:size)
  end
end