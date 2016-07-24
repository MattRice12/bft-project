class VotesController < ApplicationController
  def create
    vote = Vote.new(vote_params)
    # user = User.find_by(params[:id])
    vote.save
  end

  private
  def vote_params
    params.require(:vote).permit(:user_id, :foodtruck_id, :favorite_list)
  end
end


#votes: When user creates a new vote, the votes_count in foodtrucks increases in quantity
#favorites: When user creates a new favorite, the fav_arr in users has a new member
