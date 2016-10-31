class Link < ApplicationRecord
  validates_presence_of :url_location
  validates_uniqueness_of :url_location
  validates :url_location, :url => true

  has_many :link_tags
  has_many :tags, through: :link_tags

  validates_presence_of :title

  belongs_to :user

  enum read: {
                false: 0,
                true: 1
                }
end
