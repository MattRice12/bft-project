class UsersController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :get_user, only: [:show, :update, :destroy]

  def index
    # if authenticate_token?(params.fetch(browser_auth_token))
      users = User.page(params[:page])
      render json: users.to_json
    # end
    # in views call <%= paginate @users %>
  end

  def show
    render json: @user
  end

  def create
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

  def get_favorites
    @favorites = get_user_favorites
    render json: @favorites
  end

  private
  def get_user
    @user = User.find(params.fetch(:id))
  end

  def user_params
    params.require(:user).permit(:name, :username, :password, :auth_token)
  end
end
