class User < ApplicationRecord
  has_many :votes
  paginates_per 6
  has_secure_password
  before_create :set_auth_token

  validates :username, uniqueness: true, length: { minimum: 1, maximum: 50 }

  private
  def set_auth_token
    return if auth_token.present?
    self.auth_token = generate_aut_token
  end

  def generate_auth_token
    SecureRandom.uuid.gsub(/\-/, '')
  end
end
