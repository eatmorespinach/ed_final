class UsersController < ApplicationController
	before_action :ensure_logged_in, :only => [:edit]

	def new
	  @user = User.new
	end

	def create
	  @user = User.new(set_user)
	  if @user.save
	    redirect_to root_url, :notice => "Signed up!"
	  else
	    render :new
	  end
	end

	def show 
		@user = current_user
		#why doesn't User.find(params[:user_id]) work?
	end

	def edit
	end
private

  def set_user
    params.require(:user).permit! #what should this actually be?                                                       
  end

end
