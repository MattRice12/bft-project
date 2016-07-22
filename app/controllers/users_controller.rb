class UsersController < ApplicationController
  before_action :get_users, only: [:show, :update, :destroy]

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
  end

  def destroy
  end

  private
  def get_users
    @user = User.find(params.fetch(:id))
  end

  def user_params
    params_hash = params
    user_hash = Hash.new
    user_hash = user_hash.merge(name: params_hash[:name]) if params_hash[:name]
    user_hash = user_hash.merge(username: params_hash[:username]) if params_hash[:username]
    user_hash = user_hash.merge(password_digest: params_hash[:password_digest]) if params_hash[:password_digest]
    user_hash = user_hash.merge(favorites: params_hash[:favorites]) if params_hash[:favorites]
  end
end
