class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :album
  acts_as_votable
end
