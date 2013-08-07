class AddSoundcloudIdToSong < ActiveRecord::Migration
  def change
    add_column :songs, :soundcloud_id, :string
  end
end
