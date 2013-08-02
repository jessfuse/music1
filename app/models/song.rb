class Song < ActiveRecord::Base
  attr_accessible :artist_name, :track_title, :uid, :username
  belongs_to :user 

end
