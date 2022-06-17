class Artist < ApplicationRecord
  has_many :albums
  validates :name, presence: true

  def attributes
    { id: nil, name: nil }
  end
end
