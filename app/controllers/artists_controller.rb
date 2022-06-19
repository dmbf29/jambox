class ArtistsController < ApplicationController
  skip_after_action :verify_authorized, only: [:search]

  def search
    if params[:query].present?
      RSpotify::authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_CLIENT_SECRET'])
      @albums = RSpotify::Album.search(params[:query])
      binding.pry
    else
    end
  end
end
