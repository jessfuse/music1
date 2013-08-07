class Song < ActiveRecord::Base
  attr_accessible :artist_name, :track_title, :uid, :username
  belongs_to :user 

  has_and_belongs_to_many :playlists
  
end
