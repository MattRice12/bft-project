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
    @foodtruck = Foodtruck.create!(foodtruck_params)
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
    params_hash = params
    foodtruck_hash = Hash.new
    foodtruck_hash = foodtruck_hash.merge(name: params_hash[:name]) if params_hash[:name]
    foodtruck_hash = foodtruck_hash.merge(cuisine: params_hash[:cuisine]) if params_hash[:cuisine]
    foodtruck_hash = foodtruck_hash.merge(signature_item: params_hash[:signature_item]) if params_hash[:signature_item]
    foodtruck_hash = foodtruck_hash.merge(truck_pic: params_hash[:truck_pic]) if params_hash[:truck_pic]
    foodtruck_hash = foodtruck_hash.merge(yelp_url: params_hash[:yelp_url]) if params_hash[:yelp_url]
  end
end
