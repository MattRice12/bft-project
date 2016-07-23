class FoodtrucksController < ApplicationController
  before_action :get_foodtruck, only: [:show, :update, :destroy]
  # before_action :authenticate_token, only: [:create, :update, :destroy]

  def index
    foodtrucks = Foodtruck.top.page(params[:page])
    render json: foodtrucks.to_json(include: :votes)
  end

  def show
    render json: @foodtruck
  # rescue ActiveRecord::RecordNotFound
  #   render json: { message: "Not found", status: 404 }, status: 404
  end

  def create
    @foodtruck = Foodtruck.create!(foodtruck_params)
    if @foodtruck.yelp_url == nil
      @foodtruck.yelp_url = truck_yelp
    end
    # if @foodtruck.truck_pic == nil
      # @foodtruck.truck_pic =
    # end
    render json: @foodtruck
  # rescue ActiveRecord::RecordInvalid
  #   render json: { message: "Invalid Input", status: 400 }, status: 400
  # rescue ActiveRecord::RecordNotFound
  #   render json: { message: "Not found", status: 404 }, status: 404
  end

  def update
    @foodtruck.update(foodtruck_params)
    render json: @foodtruck
  # rescue ActiveRecord::RecordInvalid
  #   render json: { message: "Invalid Input", status: 400 }, status: 400
  end

  def destroy
    foodtruck = Foodtruck.find(params[:id])
    if foodtruck
      if authenticate_token?(params.fetch(browser_auth_token))
        render json: foodtruck.destroy
        render json: "Foodtruck deleted."
      else
        render json: { message: "You are not authorized to do this." }, status: 401
      end
    else
      render json: { message: "This foodtruck does not exist." }
    end

  # rescue ActiveRecord::RecordNotFound
  #   render json: { message: "Not found", status: 404 }, status: 404
  end

  def voting_users
    user_arr = get_users_for_vote
    render json: user_arr.to_json(except: [:name, :username, :password_digest])
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
