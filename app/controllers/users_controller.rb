class UsersController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :get_user, only: [:show, :update, :destroy]

  def index
    # if authenticate_token?(params.fetch(browser_auth_token))
      users = User.page(params[:page])
      render json: users.to_json, status: 200
    # end
    # in views call <%= paginate @users %>
  end

  def show
    if @user
      render json: @user, status: 200
    else
      render json: { message: "Not Found" }, status: 404
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: 200
    else
      render json: { message: "Invalid Input: Must have a username and password" }, status: 400
    end
  end

  def update
    @user.update(user_params)
    render json: @user, status: 200
  end

  def destroy
    render json: @user.destroy, status: 200
  end

  def get_favorites
    @favorites = get_user_favorites
    render json: @favorites, status: 200
  end

  private
  def get_user
    @user = User.find(params.fetch(:id))
  end

  def user_params
    params.require(:user).permit(:name, :username, :password, :auth_token)
  end
end
