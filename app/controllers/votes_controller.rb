class VotesController < ApplicationController
  def create
    vote = Vote.new(vote_params)
    vote.save
  end

  private
  def vote_params
    params.require(:vote).permit(:user_id, :foodtruck_id)
  end
end
