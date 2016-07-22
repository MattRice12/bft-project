class DashboardController < ApplicationController
  def index
    render json: Foodtruck.all
  end
end
