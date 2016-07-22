class UsersController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :get_user, only: [:show, :update, :destroy]
  # before_action :authenticate_token, only: [:update, :destroy]

  def index
    users = User.page(params[:page])
    render json: users
    # in views call <%= paginate @users %>
  end

  def show
    render json: @user
  end

  def create #######
    @user = User.create(user_params)
    render json: @user
  end

  def update
    @user.update(user_params)
    render json: @user
  end

  def destroy
    render json: @user.destroy
  end

  private
  def get_user
    @user = User.find(params.fetch(:id))
  end

  def user_params
    params.require(:user).permit(:name, :username, :password, :favorites, :auth_token)
  end

  protected
  def authenticate_token
    authenticate_or_request_with_http_token do |token, _|
      User.find_by(auth_token: token)
    end
  end
end
