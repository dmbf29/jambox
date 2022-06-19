namespace :album do
  desc "Creates default albums"
  task create_all: :environment do
    RSpotify::authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_CLIENT_SECRET'])
    albums = ['Kaleidoscope Dream', 'Take this to your grave', 'Take Care', 'Thank Me Later', 'Get Loose', 'electric guest kin', 'Jack Harlow Loose', 'I am the Movie']
    albums.each do |album_name|
      album = RSpotify::Album.search(album_name).first
      user = User.first
      artist = Artist.find_or_create_by(name: album.artists.first.name)
      new_album = Album.find_or_create_by(
        name: album.name,
        release_date: album.release_date,
        spotify_id: album.id,
        artist: artist
      )
      file = URI.open(album.images.first['url'])
      new_album.photo.attach(io: file, filename: 'album.png', content_type: 'image/png')

      Bookmark.create(
        album: new_album,
        user: user,
        cached_votes_total: rand(5..20)
      )
    end
  end
end
