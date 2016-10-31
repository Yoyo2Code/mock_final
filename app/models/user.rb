class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  has_secure_password

  has_many :user_links
  has_many :links, through: :user_links
end
