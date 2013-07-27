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

  	if @profile.update_attributes(profile_params)
  		redirect_to myprofile_path, notice: "Profile Updated"
  	else
  		render 'new', alert: "Error"
  	end
  end

  private

  def profile_params
    params.require(:profile).permit(:skills, :about, :hometown, :nationality, :current_city)
  end

end