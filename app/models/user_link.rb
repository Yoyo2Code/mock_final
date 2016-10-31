class UserLink < ApplicationRecord
  belongs_to :user
  belongs_to :links
end
