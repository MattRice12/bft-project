class UsersController < ApplicationController
  before_action :get_users

  def index
    @users = User.all
  
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def set_foodtruck
    @users = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :username, :password_digest)
  end
end
