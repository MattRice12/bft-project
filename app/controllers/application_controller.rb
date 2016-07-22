class ApplicationController < ActionController::API
  # protect_from_forgery with: :null_session


  # API_MESSAGE = {not_found: {status: 404, message: "resource not found!"}}

  def not_found
    render json: { message: 'Requested route not found' }, status: 404
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def user_logged_in?
    current_user.present?
  end

end
