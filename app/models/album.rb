class Album < ApplicationRecord
  belongs_to :artist
  validates :name, presence: true
  accepts_nested_attributes_for :artist
end
