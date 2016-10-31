class Link < ApplicationRecord
  validates_presence_of :url_location
  validates_uniqueness_of :url_location

  validates_presence_of :title

  enum status: %w[false true]
end
