class PasswordResetsController < ApplicationController
  def create
  	@user = User.where(email: params[:email]).first

  	@user.deliver_reset_password_instructions! if @user

  	redirect_to root_path, alert: "Instructions have been sent to your email."
  end

  def edit
  	@user = User.load_from_reset_password_token(params[:id])
  	@token = params[:id]
  	not_authenticated unless @user
  end

  def update
  	@token = params[:token]
  	@user = User.load_from_reset_password_token(params[:token])
  	not_authenticated and return unless @user
  	@user.password_confirmation = params[:user][:password]
  	if @user.change_password!(params[:user][:password])
  		redirect_to root_path, notice: "Password successfully reset!"
  	else
  		render 'edit'
  	end
  end
end
