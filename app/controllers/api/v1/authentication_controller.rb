class Api::V1::AuthenticationController < ApplicationController

  # POST /auth/login
  def login
    @user = User.find_by(email: params[:user][:email])
    if @user&.authenticate(params[:user][:password])
      render :sign_in
    else
      if @user.present? && !@user&.authenticate(params[:user][:password])
        user_message = "Invalid password entered"
      elsif @user.present?
        user_message = @user.errors.full_messages.first
      elsif @user.blank?
        user_message = "Invalid email entered"
      end
      render json: {is_success: false, error_code: 400, message: user_message, result: nil}, status: 400
    end
  end

  private

  def login_params
    params.require(:user).permit(:email, :password)
  end

end
