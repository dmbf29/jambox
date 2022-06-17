class Bookmark < ApplicationRecord
  include ActiveModel::Serialization
  belongs_to :user
  belongs_to :album
  acts_as_votable
  acts_as_taggable_on :tags
  accepts_nested_attributes_for :album

  def attributes
    { id: nil, tag_list: nil, album: nil, cached_votes_total: nil }
  end
end
