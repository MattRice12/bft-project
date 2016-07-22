class FoodtrucksController < ApplicationController
  before_action :get_foodtruck, only: [:show, :update, :destroy]
  before_action :authenticate_via_token, except: [:create, :update, :destroy]

  def index
    foodtrucks = Foodtruck.order(votes_count: :DESC).page(params[:page])
    render json: foodtrucks
  end

  def show
    render json: @foodtruck
  rescue ActiveRecord::RecordNotFound
    render json: { message: "Not found", status: 404 }, status: 404
  end

  def create
    @foodtruck = Foodtruck.create!(foodtruck_params)
    if @foodtruck.yelp_url == nil
      @foodtruck.yelp_url = truck_yelp
    end
    render json: @foodtruck
  rescue ActiveRecord::RecordInvalid
    render json: { message: "Invalid Input", status: 400 }, status: 400
  rescue ActiveRecord::RecordNotFound
    render json: { message: "Not found", status: 404 }, status: 404
  end

  def update
    @foodtruck.update(foodtruck_params)
    render json: @foodtruck
  rescue ActiveRecord::RecordInvalid
    render json: { message: "Invalid Input", status: 400 }, status: 400
  end

  def destroy
    render json: @foodtruck.destroy
    ## where does this redirect to? if anywhere? # may want to redirect it to the same page you were on.

  rescue ActiveRecord::RecordNotFound
    render json: { message: "Not found", status: 404 }, status: 404
  end

  private
  def get_foodtruck
    @foodtruck = Foodtruck.find(params.fetch(:id))
  end

  def foodtruck_params
    params.require(:foodtruck).permit(:name, :cuisine, :signature_item, :truck_pic, :yelp_url)
  end

  def truck_yelp
    "http://www.yelp.com/biz/#{params[:foodtruck][:name].gsub(/\s/, '-').gsub(/[']/, '')}-austin"
  end

end
