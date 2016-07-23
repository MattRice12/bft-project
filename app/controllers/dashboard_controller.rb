class DashboardController < ApplicationController
  # before_action :authenticate_token, except: [:index]

  def index
    foodtrucks = Foodtruck.top.page(params[:page])
    render json: foodtrucks.to_json(include: :votes)
  end
  #
  # ################ For adding a 'vote_count' to the foodtruck ####
  # def update
  #   @foodtrucks.update(foodtruck_params)
  #
  #   render json:
  # end
end
