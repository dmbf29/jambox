require 'open-uri'
Bookmark.destroy_all
Album.destroy_all
Artist.destroy_all

puts 'Getting Admin users...'
doug = User.find_by(email: 'douglasmberkley@gmail.com') || User.create!(email: 'douglasmberkley@gmail.com', password: ENV['ADMIN_PASSWORD'], admin: true, name: 'Doug')

unless doug.photo.attached?
  puts 'Attached user photos...'
  file = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1523933095/viqfqp0tfkmcwmj7cfwe.jpg')
  doug.photo.attach(io: file, filename: 'user.png', content_type: 'image/png')
end

puts 'Creating artists...'
mac = Artist.create!(name: 'Mac Miller')
tuxedo = Artist.create!(name: 'Tuxedo')
puts "...created #{Artist.count} artists."

puts 'Creating albums...'
circles = Album.create!(
  name: 'Circles',
  release_date: Date.parse('January 17, 2020'),
  artist: mac
)
file = URI.open('https://i.scdn.co/image/ab67616d0000b27326b7dd89810cc1a40ada642c')
circles.photo.attach(io: file, filename: 'album.png', content_type: 'image/png')

swimming = Album.create!(
  name: 'Swimming',
  release_date: Date.parse('August 3, 2018'),
  artist: mac
)
file = URI.open('https://i.scdn.co/image/ab67616d0000b273175c577a61aa13d4fb4b6534')
swimming.photo.attach(io: file, filename: 'album.png', content_type: 'image/png')

tuxedo_one_album = Album.create!(
  name: 'Tuxedo',
  release_date: Date.parse('March 3, 2015'),
  artist: tuxedo
)
file = URI.open('https://i.scdn.co/image/ab67616d0000b2730771a97700015a50f73f14e3')
tuxedo_one_album.photo.attach(io: file, filename: 'album.png', content_type: 'image/png')

tuxedo_two_album = Album.create!(
  name: 'Tuxedo II',
  release_date: Date.parse('March 24, 2017'),
  artist: tuxedo
)
file = URI.open('https://i.scdn.co/image/ab67616d0000b273504fb7fb29f2f72ec3e12ab1')
tuxedo_two_album.photo.attach(io: file, filename: 'album.png', content_type: 'image/png')

tuxedo_three_album = Album.create!(
  name: 'Tuxedo III',
  release_date: Date.parse('Jul 19, 2019'),
  artist: tuxedo
)
file = URI.open('https://i.scdn.co/image/ab67616d0000b273687bbe97b3ed0d0e6199ddee')
tuxedo_three_album.photo.attach(io: file, filename: 'album.png', content_type: 'image/png')

puts "...created #{Album.count} albums."

puts 'Creating bookmarks...'
circles_bookmark = Bookmark.create!(
  album: circles,
  user: doug
)

swimming_bookmark = Bookmark.create!(
  album: swimming,
  user: doug
)

tux_one_bookmark = Bookmark.create!(
  album: tuxedo_one_album,
  user: doug
)

tux_two_bookmark = Bookmark.create!(
  album: tuxedo_two_album,
  user: doug
)

tux_three_bookmark = Bookmark.create!(
  album: tuxedo_three_album,
  user: doug
)
puts "...created #{Bookmark.count} bookmarks."

puts "Adding tags..."
circles_bookmark.tag_list.add('hip-hop', 'chill')
swimming_bookmark.tag_list.add('hip-hop', 'chill')
tux_one_bookmark.tag_list.add('funk', 'upbeat', 'feel good')
tux_two_bookmark.tag_list.add('funk', 'upbeat', 'feel good')
tux_three_bookmark.tag_list.add('funk', 'upbeat', 'feel good')


puts 'Adding "listens" to bookmarks...'
5.times do
  circles_bookmark.vote_by voter: doug, duplicate: true
  tux_three_bookmark.vote_by voter: doug, duplicate: true
end
tux_three_bookmark.vote_by voter: doug, duplicate: true
swimming_bookmark.vote_by voter: doug, duplicate: true
puts "...#{tux_three_bookmark.album.name} has been liked #{tux_three_bookmark.cached_votes_total} times"
puts "...#{circles_bookmark.album.name} has been liked #{circles_bookmark.cached_votes_total} times"
puts "...#{swimming_bookmark.album.name} has been liked #{swimming_bookmark.cached_votes_total} times"
