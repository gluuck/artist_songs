class AddIndexesTo < ActiveRecord::Migration[7.0]
  def change
    add_index :artists, :name
    add_index :songs, :title    
    add_index :songs, :created_at
    add_column :songs, :downloads_count, :integer, default: 0, null: false
    add_index :songs, :downloads_count
  end
end
