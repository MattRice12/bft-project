class SessionsController < ApplicationController
  # before_action :authenticate_via_token, only: [:sign_in, :create]

  def create
    user = User.find_by(username: params.fetch(:username))

    if user && user.authenticate(params.fetch(:password))
      render json: { auth_token: user.auth_token }
    else
      render json: { message: "Username or Password were incorrect." }, status: 401
    end
  end
