class Foodtruck < ApplicationRecord
  has_many :votes
  paginates_per 6

  validates :name, uniqueness: true, length: { minimum: 1, maximum: 50 }
  validates :cuisine, presence: true

  def vote_count
    votes.count
  end

  def self.top
    joins("left join votes on votes.foodtruck_id = foodtrucks.id")
    .group("foodtrucks.id, foodtrucks.name")
    .order("count(votes.id) desc")
  end
end



# class Physician < ApplicationRecord
#   has_many :appointments
#   has_many :patients, through: :appointments
# end
#
# class Appointment < ApplicationRecord
#   belongs_to :physician
#   belongs_to :patient
# end
#
# class Patient < ApplicationRecord
#   has_many :appointments
#   has_many :physicians, through: :appointments
# end
