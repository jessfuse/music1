class Playlist < ActiveRecord::Base
  attr_accessible :playlist_id, :uid
  attr_accessor :uid, :path_connect, :fake_url

  has_and_belongs_to_many :users
  has_and_belongs_to_many :songs

  def self.fetch_songs 
    # to set a user by their uid associated with this playlist
    user = User.where(:uid => self.uid).first
    @client = Soundcloud.new(:access_token => user.soundcloud_token)

      # '#{@user.soundcloud_token}')

    # get playlist
    # @path = 'http://soundcloud.com/users/' + self.uid 
    @path_connect = "https://api.soundcloud.com/playlists/8492346"

    path = '/users/' + self.uid + '/playlists'
    playlists = @client.get(path)
    @Playlists_id = playlists.id

    # @url = "http://player.soundcloud.com/player.swf?url="+@path_connect+"&enable_api=true&object_id=myPlayer" 


    # playlists.each do |pl|
    #   puts pl.id
    #   pl.tracks.each do |track|
    #     puts track.uri
    #     puts track.id 
    #   end
    # end

  end

  def self.return_url
    @path_connect = "https://api.soundcloud.com/playlists/8492346"
  end 

end