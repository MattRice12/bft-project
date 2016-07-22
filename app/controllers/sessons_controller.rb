class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:sign_in, :create]

  def sign_in
  end

  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      #flash[:notice] = "Successfully signed in!"
      redirect_to foodtrucks_path ##where do I want this to redirect to?
    else
      #flash[:alert] = "Username and password did not match any records"
      render :sign_in
    end
  end

  def destroy
    session[:user_id] = nil
    #flash[:notice] = "Signed out!"
    render_to sign_in_path
  end

  def sign_out
  end
end
