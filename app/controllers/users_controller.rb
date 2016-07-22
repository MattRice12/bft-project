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
    @user = User.create!(user_params)
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
    params_hash = params
    user_hash = Hash.new
    user_hash = user_hash.merge(name: params_hash[:name])
    user_hash = user_hash.merge(username: params_hash[:username])
    user_hash = user_hash.merge(password_digest: params_hash[:password_digest])
    user_hash = user_hash.merge(favorites: params_hash[:favorites])
  end
end
