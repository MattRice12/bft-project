class FoodtrucksController < ApplicationController
  before_action :get_foodtruck, only: [:show, :update, :destroy]
  # before_action :authenticate_token, only: [:create, :update, :destroy]

  def index
    foodtrucks = Foodtruck.order(votes_count: :desc).page(params[:page])
    render json: foodtrucks.to_json, status: 200
  end

  def show
    if @foodtruck
      render json: @foodtruck, status: 200
    else
      render json: { message: "Not Found" }, status: 404
    end
  end

  def create
    @foodtruck = Foodtruck.new(foodtruck_params)
    user = User.find_by(auth_token: params[auth_token])
    foodtruck.user_id = user.id
    if @foodtruck.yelp_url == nil
      @foodtruck.yelp_url = truck_yelp
    end
    if @foodtruck.truck_pic == nil
      @foodtruck.truck_pic = truck_picchas
    end
    if @foodtruck.save
      render json: @foodtruck
    else
      render json: @foodtruck.errors
    end
  end

  def update
    foodtruck = Foodtruck.find(params.fetch(:id))
    user = User.find_by(auth_token: params[auth_token])
    if foodtruck.user_id == user.id
      if foodtruck.update(foodtruck_params)
        render json: foodtruck, status: 200
      else
        render json: { message: "Invalid Input" }, status: 400
      end
    else
      render json: { message: "Internal Server Error" }, status: 500
    end
  end

  def destroy
    if @foodtruck
      if authenticate_token?(params.fetch(:browser_auth_token))
        if foodtruck.user_id == user.id
          render json: @foodtruck.destroy, status: 200
        else
          render json: { message: "You are not authorized to take this action" }, status: 401
        end
      else
        render json: { message: "I'm a teapot (Log in first, dummy)" }, status: 418
      end
    else
      render json: { message: "This foodtruck does not exist." }
    end
  end

  private
  def get_foodtruck
    @foodtruck = Foodtruck.find(params.fetch(:id))
  end

  def foodtruck_params
    params.require(:foodtruck).permit(:name, :cuisine, :signature_item, :truck_pic, :yelp_url, :comments)
  end

  def truck_yelp
    "http://www.yelp.com/biz/#{params[:foodtruck][:name].gsub(/\s/, '-').gsub(/[']/, '')}-austin"
  end

  def truck_picchas
    @pics = Hash.new
    @pics = {"ITALIAN"=>"http://viztangocafe.com/wp-content/uploads/2015/06/food2.jpg",
     "CHINESE"=>"http://www.kowloonnc.com/resources/img/backgrounds/chinese_2.jpg",
     "THAI"=>"http://thethaichili.net/site/wp-content/uploads/2013/05/pad-thai.jpg",
     "GREEK"=>"https://www.hungerpass.com/wp-content/uploads/2016/02/greekcove4.jpg",
     "MEXICAN"=> "http://img2.timeinc.net/people/i/2016/greatideas/blog/160118/tacos-600x800.jpg",
     "AMERICAN"=>"https://www.waiter.com/blog/wp-content/uploads/2015/06/hamburger.jpg",
     "LATIN"=>"http://www.seriouseats.com/images/2013/09/20130831-huevos-rancheros-breakfast-tacos-recipe-2.jpg",
     "DESSERT"=>"http://static.oprah.com/images/o2/201208-omag-cones-949x534.jpg",
     "VEGAN"=>"http://cdn.everything.io/vegankit/images/veggies.jpg",
     "VEGETARIAN"=>"http://www.internationalsupermarketnews.com/wp-content/uploads/2016/02/vegetarian-food.jpg",
     "BRUNCH"=>"https://blog.vegas.com/wp-content/uploads/2015/09/Brunch-Border-Grill1.jpg",
     "COFFEE"=>"http://genechanger.com/wp-content/uploads/2015/01/Coffee-and-Tea.jpg",
     "CUBAN"=>"http://www.nationalturk.com/en/wp-content/uploads/2011/07/Cuban-Food-Culture-cuisine-nationalturk-24576.jpg",
     "VIETNAMESE"=>"http://epicureandculture.com/wp-content/uploads/2015/09/shutterstock_204875356.jpg",
     "GLUTENFREE"=>"http://deliciousliving.com/site-files/newhope360.com/files/uploads/2011/09/91253417.jpg",
     "OTHER"=>"http://www.hotwallpapersforfree.com/images/thumb/Cute-Taco-Wallpaper-Taco-cat-64078.jpg"
   }
    @pics.values_at((params[:foodtruck][:cuisine]).upcase).join
  end
end
