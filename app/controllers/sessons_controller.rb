class SessionsController < ApplicationController
  # before_action :authenticate_via_token, only: [:sign_in, :create]

  def sign_in
  end

  def authenticate
    user = User.find_by(username: params.fetch(:username))

    if user && user.authenticate(params.fetch(:password_digest))
      render json: { auth_token: user.auth_token }
    else
      render json: { message: "Username or Password were incorrect." }, status: 401
    end
  end

  def destroy
    session[:auth_token] = nil
    flash[:notice] = "Signed out!"
    render_to sign_in_path
  end

  def sign_out
  end
end
