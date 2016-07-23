class User < ApplicationRecord
  has_many :votes
  paginates_per 6
  has_secure_password
  before_create :set_auth_token

  validates :username, uniqueness: true, length: { minimum: 1, maximum: 50 }

  private
  def set_auth_token #when they create a new account, it we store an authentication token for them.
    return if auth_token.present?
    self.auth_token = generate_auth_token
  end

  def generate_auth_token
    SecureRandom.uuid.gsub(/\-/, '')
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
