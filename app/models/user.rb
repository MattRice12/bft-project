class User < ApplicationRecord
  has_many :votes
  paginates_per 3

  validates :username, uniqueness: true, length: { minimum: 1, maximum: 50 }
end
