class CreateSongs < ActiveRecord::Migration[7.0]
  def change
    create_table :songs do |t|
      t.references :artist, null: false, foreign_key: { to_table: :artists }
      t.string :title, default: '', null: false
      t.float  :length, default: 0, null: false 
      t.float :filesize, default: 0, null: false

      t.timestamps
    end
  end
end
