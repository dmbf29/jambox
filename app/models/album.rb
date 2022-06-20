require 'open-uri'

class Album < ApplicationRecord
  belongs_to :artist
  has_many :bookmarks, dependent: :destroy
  validates :name, presence: true
  has_one_attached :photo
  accepts_nested_attributes_for :artist

  def attributes
    {
      id: nil,
      name: nil,
      release_date: nil,
      photo_url: photo_url,
      artist: nil
    }
  end

  def upload_photo(url)
    file = URI.open(url)
    photo.attach(io: file, filename: 'album.png', content_type: 'image/png')
  end

  def photo_url
    Cloudinary::Utils.cloudinary_url(photo.key)
  end
end
