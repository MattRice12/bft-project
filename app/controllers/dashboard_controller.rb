class DashboardController < ApplicationController
  # before_action :authenticate_token, except: [:index]

  def index
    foodtrucks = Foodtruck.order(votes_count: :desc).page(params[:page])
    render json: foodtrucks.to_json
  end
end
