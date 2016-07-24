class SessionsController < ApplicationController
  # before_action :authenticate_via_token, only: [:, :create]

  def sign_in
    #this hands them the auth_token that I have saved for them.
    #when they give me a username and password that matches my database, I give them an auth_token
    user = User.find_by(username: params.fetch(:username))

    if user && user.authenticate(params.fetch(:password))
      render json: { auth_token: user.auth_token } #I give the user an authentication token so he can buy beer #can't buy beer without an auth_token #user carries his token in his 'front-end'
    else
      render json: { message: "Username or Password were incorrect." }, status: 401
    end
  end

  def sign_out
  end
end
