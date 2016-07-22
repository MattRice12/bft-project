class User < ApplicationRecord
  has_many :votes

  validates :name, uniqueness: true, length: { minimum: 1, maximum: 50 }
end
