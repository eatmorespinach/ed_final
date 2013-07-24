class ProfilesController < ApplicationController
  def my_profile
  	@profile = current_user.profile
  end

  def index
  	@profiles = Profile.all
  end

  def show
  	@profile = Profile.find(params[:id])
  end

  def edit
  	@profile = current_user.profile
  end

  def update
  	@profile = current_user.profile

  	if @profile.update_attributes(params_profile)
  		redirect_to myprofile_path, notice: "Profile Updated"
  	else
  		render 'new', alert: "Error"
  	end
  end

end