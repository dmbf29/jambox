class Album < ApplicationRecord
  belongs_to :artist
  validates :name, presence: true
  has_one_attached :photo
  accepts_nested_attributes_for :artist

  def attributes
    {
      id: id,
      name: name,
      release_date: release_date,
      photo: Cloudinary::Utils.cloudinary_url(photo.key),
      artist_name: artist.name
    }
  end
end
