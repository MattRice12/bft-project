class DashboardController < ApplicationController
  # before_action :authenticate_token, except: [:index]

  def index
    render json: Foodtruck.all
  end

  ################ For adding a 'vote_count' to the foodtruck ####
  def update
    @foodtrucks.update(foodtruck_params)

    render json:
  end
end
