class Bookmark < ApplicationRecord
  include ActiveModel::Serialization
  belongs_to :user
  belongs_to :album
  acts_as_votable
  acts_as_taggable_on :tags
  accepts_nested_attributes_for :album

  def attributes
    {
      id: id,
      tag_list: tag_list
    }
  end
end
