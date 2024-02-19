class Download < ApplicationRecord
  belongs_to :artist
  belongs_to :song, counter_cache: true
end
