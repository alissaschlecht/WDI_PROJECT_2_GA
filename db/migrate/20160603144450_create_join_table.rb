class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :users, :playlists do |t|
    end
  end
end
