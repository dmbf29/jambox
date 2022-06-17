class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookmarks
  has_many :albums, through: :bookmarks
  has_many :artists, through: :albums
  has_one_attached :photo
  acts_as_voter

  def self.find_for_spotify_oauth(request)
    spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    user_params = {
      provider: 'spotify',
      email: spotify_user.email,
      token: spotify_user.credentials.token,
      picture_url: spotify_user.images&.first&.url,
      spotify_id: spotify_user.id,
      name: spotify_user.display_name
    }
    user = User.find_by(provider: 'spotify', spotify_id: spotify_user.id)
    user ||= User.find_by(email: spotify_user.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end
    return user
  end
end
