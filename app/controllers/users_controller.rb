class UsersController < ApplicationController
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

  def foodtruck_params
    params.require(:user).permit(:name, :username, :password_digest)
  end
end




  create_table "users", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.string   "favorites"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end
