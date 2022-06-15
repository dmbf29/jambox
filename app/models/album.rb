class Album < ApplicationRecord
  belongs_to :artist
  validates :name, presence: true
  has_one_attached :photo
  accepts_nested_attributes_for :artist
end
