class UsersController < ApplicationController
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
		git 
	end


private

  def set_user
    params.require(:user).permit! #what should this actually be?                                                       
  end

end
