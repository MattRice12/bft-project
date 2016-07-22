class FoodtrucksController < ApplicationController
  before_action :get_foodtruck, only: [:show, :update, :destroy]

  def index
    foodtrucks = Foodtruck.page(params[:page])
    render json: foodtrucks
    # in views call <%= paginate @foodtrucks %>
  end

  def show
    render json: @foodtruck
  end

  def create
    @foodtruck = Foodtruck.create(foodtruck_params)
    render json: @foodtruck
  end

  def update
    @foodtruck.update(foodtruck_params)
    render json: @foodtruck
  end

  def destroy
    render json: @foodtruck.destroy
  end

  private
  def get_foodtruck
    @foodtruck = Foodtruck.find(params.fetch(:id))
  end

  def foodtruck_params
    params.require(:foodtruck).permit(:name, :cuisine, :signature_item, :truck_pic, :yelp_url)
  end
end
