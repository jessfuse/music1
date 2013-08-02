class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :artist_name
      t.string :track_title
      t.integer :uid
      t.string :username
      t.integer :user_id

      t.timestamps
    end
  end
end
