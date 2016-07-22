class FoodtrucksController < ApplicationController
  def index
    render json: Foodtruck.all
  end

  def show
    render json: @foodtruck
  end

  def create
    foodtruck = Foodtruck.new(foodtruck_params)
    if foodtruck.save
      render json: foodtruck
    else
      render json: { message: "Invalid Input", status: 400 }, status: 400
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def get_foodtruck
    @foodtruck = Foodtruck.find(params[:id])
  end

  def foodtruck_params
    params.require(:foodtruck).permit(:name, :cuisine, :signature_item, :truck_pic, :yelp_url)
  end
end
