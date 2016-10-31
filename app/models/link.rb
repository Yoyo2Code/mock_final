class Link < ApplicationRecord
  validates_presence_of :url_location
  validates_uniqueness_of :url_location
  validates :url_location, :url => true

  validates_presence_of :title

  belongs_to :user

  enum status: %w[false true]
end
