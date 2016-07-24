class User < ApplicationRecord
  has_many :votes
  paginates_per 6
  has_secure_password
  before_create :set_auth_token

  validates :username, uniqueness: true, length: { minimum: 1, maximum: 50 }
  validates :password, presence: true

  # def self.favorites
  #   user_favorite = Votes.find_by(id: user_id)
  #   foodtruck_stuff = Foodtruck.find_by(id: )
  # end

  def favorite_list
    favorite_list.unique
  end

  # def self.top
  #   joins("right join votes on votes.user_id = users.id")
  #   .select("users.*")
  #   .group("users.id, users.favorites")
  #   .order("count(votes.id) desc")
  # end

  private
  def set_auth_token #when they create a new account, it we store an authentication token for them.
    return if auth_token.present?
    self.auth_token = generate_auth_token
  end

  def generate_auth_token
    SecureRandom.uuid.gsub(/\-/, '')
  end
end
