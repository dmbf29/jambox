class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :album
  acts_as_votable
  accepts_nested_attributes_for :album
end
