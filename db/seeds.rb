require 'open-uri'

puts 'Getting Admin users...'
doug = User.find_by(email: 'douglasmberkley@gmail.com') || User.create!(email: 'douglasmberkley@gmail.com', password: ENV['ADMIN_PASSWORD'], admin: true, first_name: 'Doug', last_name: 'Berkley')

unless doug.photo.attached?
  puts 'Attached user photos...'
  file = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1523933095/viqfqp0tfkmcwmj7cfwe.jpg')
  doug.photo.attach(io: file, filename: 'user.png', content_type: 'image/png')
end

puts 'Creating artists...'
artist = Artist.create!(name: 'Mac Miller')
puts "...created #{Artist.count} artists."

puts 'Creating albums...'
circles = Album.create!(
  name: 'Circles',
  release_date: Date.parse('January 17, 2020'),
  artist: artist
)

swimming = Album.create!(
  name: 'Swimming',
  release_date: Date.parse('August 3, 2018'),
  artist: artist
)
puts "...created #{Album.count} albums."

puts 'Creating bookmarks...'
circles_bookmark = Bookmark.create!(
  album: circles,
  user: doug
)

Bookmark.create!(
  album: swimming,
  user: doug
)
puts "...created #{Bookmark.count} bookmarks."

puts 'Adding "listens" to bookmarks...'
5.times do
  circles_bookmark.vote_by voter: doug, duplicate: true
end
puts "...#{circles_bookmark.album.name} has been liked #{circles_bookmark.cached_votes_total} times"
