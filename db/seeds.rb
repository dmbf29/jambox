require 'open-uri'

puts 'Getting Admin users...'
doug = User.find_by(email: 'douglasmberkley@gmail.com') || User.create(email: 'douglasmberkley@gmail.com', password: ENV['ADMIN_PASSWORD'], admin: true, first_name: 'Doug', last_name: 'Berkley')

unless doug.photo.attached?
  file = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1523933095/viqfqp0tfkmcwmj7cfwe.jpg')
  doug.photo.attach(io: file, filename: 'user.png', content_type: 'image/png')
end
