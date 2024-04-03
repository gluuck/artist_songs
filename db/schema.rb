# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_04_03_122218) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_artists_on_name"
  end

  create_table "downloads", force: :cascade do |t|
    t.bigint "artist_id", null: false
    t.bigint "song_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_downloads_on_artist_id"
    t.index ["song_id"], name: "index_downloads_on_song_id"
  end

  create_table "songs", force: :cascade do |t|
    t.bigint "artist_id", null: false
    t.string "title", default: "", null: false
    t.float "length", default: 0.0, null: false
    t.float "filesize", default: 0.0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "downloads_count", default: 0, null: false
    t.index ["artist_id", "downloads_count"], name: "index_songs_on_artist_id_and_downloads_count"
    t.index ["artist_id"], name: "index_songs_on_artist_id"
    t.index ["created_at"], name: "index_songs_on_created_at"
    t.index ["downloads_count"], name: "index_songs_on_downloads_count"
    t.index ["title"], name: "index_songs_on_title"
  end

  add_foreign_key "downloads", "artists"
  add_foreign_key "downloads", "songs"
  add_foreign_key "songs", "artists"
end
