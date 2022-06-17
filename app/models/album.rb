class Album < ApplicationRecord
  belongs_to :artist
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

  def photo_url
    Cloudinary::Utils.cloudinary_url(photo.key)
  end
end
