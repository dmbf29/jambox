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
end
