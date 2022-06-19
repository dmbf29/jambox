class AlbumsController < ApplicationController
  skip_after_action :verify_authorized, only: [:search]

  def search
    RSpotify::authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_CLIENT_SECRET'])
    @albums = RSpotify::Album.search(params[:query])
  end
end
