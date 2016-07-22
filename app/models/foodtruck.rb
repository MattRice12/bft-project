class Foodtruck < ApplicationRecord
  has_many :votes
  paginates_per 3

  validates :name, uniqueness: true, length: { minimum: 1, maximum: 50 }
  validates :cuisine, presence: true

end
