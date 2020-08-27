class Api::V1::BaseController < ActionController::API
  skip_before_action :authenticate_user!, raise: false
  before_action :authenticate_request!

  protected

  def authenticate_request!
    begin
      payload = JsonWebToken.decode(auth_token)
      @current_user = User.find_by_id(payload["sub"])
      render json: {is_success: false, error_code: 400, message: "Invalid auth token", result: nil } if @current_user.nil?
    rescue JWT::DecodeError
      render json: {is_success: false, error_code: 400, message: "Invalid auth token", result: nil }
    end
  end

  def auth_token
    @auth_token ||= request.headers['Authorization']
  end
end
