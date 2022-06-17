namespace :album do
  desc "Creates default albums"
  task create_all: :environment do
    RSpotify::authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_CLIENT_SECRET'])
    albums = ['Kaleidoscope Dream', 'Take this to your grave', 'Take Care', 'Thank Me Later', 'Get Loose', 'Kin', 'Loose', 'I am the Movie']
    albums.each do |album_name|
      album = RSpotify::Album.search(album_name).first
      user = User.first
      artist = Artist.find_or_create_by(name: album.artists.first.name)
      album = Album.find_or_create_by(
        name: album.name,
        release_date: album.release_date,
        spotify_id: album.id,
        artist: artist
      )
      Bookmark.create(
        album: album,
        user: user,
        cached_votes_total: rand(5..20)
      )
    end
  end
end
