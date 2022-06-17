require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, ENV["SPOTIFY_CLIENT_ID"], ENV["SPOTIFY_CLIENT_SECRET"], scope: 'user-read-email playlist-modify-public user-library-read user-read-recently-played user-top-read user-read-playback-position user-read-currently-playing streaming'
end

OmniAuth.config.allowed_request_methods = [:post, :get]
