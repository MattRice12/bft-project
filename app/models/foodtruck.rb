class Foodtruck < ApplicationRecord
  has_many :votes
  paginates_per 6

  validates :name, uniqueness: true, length: { minimum: 1, maximum: 50 }
  validates :cuisine, presence: true


  # def votes_count
  #   votes.count
  # end

end
