class User < ApplicationRecord
  has_many :votes
  paginates_per 3
  has_secure_password
  before_create :set_auth_token

  validates :username, uniqueness: true, length: { minimum: 1, maximum: 50 }

  private
  def set_auth_token
    if auth_token.nil?
      self.auth_token = SecureRandom.uuid.delete("-")
    end
  end
end
