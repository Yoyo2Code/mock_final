class Link < ApplicationRecord
  validates_presence_of :url_location
  validates_uniqueness_of :url_location
  validates :url_location, :url => true

  validates_presence_of :title

  has_many :user_links
  has_many :users, through: :user_links

  enum status: %w[false true]
end
