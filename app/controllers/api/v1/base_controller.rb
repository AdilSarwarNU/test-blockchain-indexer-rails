class Api::V1::BaseController < ActionController::API

  protected

  def authenticate_request!
    begin
      payload = JsonWebToken.decode(auth_token)
      @current_user = User.find_by_id(payload["sub"])
    rescue ActiveRecord::RecordNotFound => e
      render json: {errors: e.message}, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: {errors: e.message}, status: :unauthorized
    end
  end

  def auth_token
    @auth_token ||= request.headers['Authorization']
  end
end
