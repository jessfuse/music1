class ApplicationController < ActionController::Base
  protect_from_forgery



  
    #create a client object with your app credentials
    # client = Soundcloud.new(:client_id => ENV['SOUNDCLOUD_CLIENT_ID'])
    # #fetch track to stream
    # track = client.get('/users/52173235/tracks/103621673')
    
    # #get the tracks streaming URL
    # @stream_url = client.get(track.stream_url, :allow_redirects => true)
  
end
