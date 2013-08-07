class AddUserIdToPlaylist < ActiveRecord::Migration
  def change
    add_column :playlists, :user_id, :integer
    rename_column :playlists, :playlist_id, :soundcloud_id
  end
end
