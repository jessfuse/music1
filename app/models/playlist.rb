class Playlist < ActiveRecord::Base
  attr_accessible :playlist_id, :uid
  attr_accessor :uid, :path_connect, :fake_url

  belongs_to :user
  has_and_belongs_to_many :songs

  def self.import_for_user(user)
    # to set a user by their uid associated with this playlist
    client = Soundcloud.new(:access_token => user.soundcloud_token)

      # '#{@user.soundcloud_token}')

    # get playlist
    # @path = 'http://soundcloud.com/users/' + self.uid 
    # @path_connect = "https://api.soundcloud.com/playlists/8492346"

    path = '/users/' + user.uid + '/playlists'
    playlists = client.get(path)
    # playlist_id = playlists.id

    # @url = "http://player.soundcloud.com/player.swf?url="+@path_connect+"&enable_api=true&object_id=myPlayer" 


    playlists.each do |pl|
      puts pl.id
      playlist = user.playlists.find_or_initialize_by_soundcloud_id(pl.id)
      playlist.soundcloud_id = pl.id
      playlist.save
      pl.tracks.each do |track|
        puts track.uri
        puts track.id 
        song = playlist.songs.find_or_initialize_by_soundcloud_id(track.id)
        song.user = user
        song.soundcloud_id = track.id
        song.track_title = track.title
        # song.artist_name = track.artist
        song.save
      end
    end

  end

  def soundcloud_url
    "https://api.soundcloud.com/playlists/#{soundcloud_id}"
  end

  def self.return_url
    "https://api.soundcloud.com/playlists/8492346"
  end 

end