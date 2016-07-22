class DashboardController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    render json: Foodtruck.all
  end
  #
  ################# For adding a 'vote_count' to the foodtruck ####
  # def update
  #   @foodtrucks.update(foodtruck_params)
  #
  #   render json:
  # end
end
