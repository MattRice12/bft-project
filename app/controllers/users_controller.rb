class UsersController < ApplicationController
  before_action :get_user, only: [:show, :update, :destroy]

  def index
    users = User.page(params[:page])
    render json: users
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

  private
  def get_user
    @user = User.find(params.fetch(:id))
  end

  def user_params
    params.require(:user).permit(:name, :username, :password_digest, :favorites)
  end
end
