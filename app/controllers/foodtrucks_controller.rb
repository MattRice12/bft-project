class FoodtrucksController < ApplicationController
  def index
    @foodtrucks = Foodtruck.all
    if page && total_pages(3) <= @foodtrucks.count #checks if there is a page action and counts if the number of food trucks is greater than the item limit per page(3) times the page number.
      render json: @foodtrucks[limit_per_page(3)], status: "200 OK"
    else
      render json: @foodtrucks, status: "200 OK"
#     render json: @foodtrucks[0..2], status: "200 OK" #runs if there is no page action and shows first 3 items.
    end #need to figure out how to get a path for [:action] == ?page=2
        #need to page.to_i because page is a string
  end

  def show
    @foodtruck = get_foodtruck
    render json: @foodtruck
  end

  def create
    @foodtruck = Foodtruck.create!(foodtruck_params)
    render json: @foodtruck
  end

  def update
    get_foodtruck
    @foodtruck.update(foodtruck_params)
    render json: @foodtruck
  end

  def destroy
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

  def page
    params[:page]
  end

  def total_pages(n)
    page.to_i * n
  end

  def limit_per_page(n)
    ((page.to_i - 1) * n)..((page.to_i * n) - 1)
  end
end
