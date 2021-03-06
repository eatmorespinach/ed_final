class SessionsController < ApplicationController
	
	def new
	end

	def create
	  user = login(params[:email], params[:password])
	  if user
	    redirect_back_or_to listings_path
	  else
	    flash.now.alert = "Email or password was invalid"
	    render :new
	  end
	end

	def destroy
	  logout
	  redirect_to root_url, :alert => "Logged out"
	end
end
