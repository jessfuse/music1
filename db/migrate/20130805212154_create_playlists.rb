class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.string :playlist_id
      t.string :uid

      t.timestamps
    end
  end
end
