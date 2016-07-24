class DashboardController < ApplicationController
  # before_action :authenticate_token, except: [:index]

  def index
    foodtrucks = Foodtruck.order(votes_count: :desc).page(params[:page])
    render json: foodtrucks.to_json
  end
  #
  # ################ For adding a 'vote_count' to the foodtruck ####
  # def update
  #   @foodtrucks.update(foodtruck_params)
  #
  #   render json:
  # end
end
