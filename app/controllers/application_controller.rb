class ApplicationController < ActionController::API
  # protect_from_forgery with: :null_session

  # before_filter :current_user

  # API_MESSAGE = {not_found: {status: 404, message: "resource not found!"}}

  # def not_found
  #   render json: { message: 'Requested route not found' }, status: 404
  # end

  def authenticate_token?(token)
    #when they want to do something, they need to give me a token. This makes sure the token they give me is the one I have stored.
    User.find_by(auth_token: token)
  end



  
end
