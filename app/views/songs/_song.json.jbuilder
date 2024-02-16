json.extract! song, :id, :title, :length, :filesize, :created_at, :updated_at
json.url song_url(song, format: :json)
