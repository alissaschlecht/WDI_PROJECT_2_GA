class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :genre
      t.string :artist
      t.integer :playlist_id
      t.string :start_time
      t.string :end_time

      t.timestamps null: false
    end
  end
end
