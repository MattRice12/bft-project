class ApplicationController < ActionController::API
  # protect_from_forgery with: :null_session

  def not_found
    render json: { message: 'Requested route not found' }, status: 404
  end
end
