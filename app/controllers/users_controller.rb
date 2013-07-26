class UsersController < ApplicationController
	before_action :require_login, :only => [:edit]

	def new
	  @user = User.new
	end

	def create
	  @user = User.new(set_user)
	  if @user.save
	  	auto_login(@user)
			@profile = @user.create_profile_build


			# @review = @product.reviews.build(params[:review])
    	# @review.user_id = current_user.id

    	@profile = @user.profiles.build(params[:profile])
    	@profile.user_id = current_user.id
	    redirect_to myprofile_path, :alert => "Welcome to StayTraders. View Hostings below"
	  else
	    render :new
	  end
	end

	def show 
		@user = current_user
	end

	def edit
		#this will be settings
	end

private

  def set_user
    params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation, :email) #what should this actually be?                                                       
  end

  # def params_profile
		# params.require(:profile).permit!  	
  # end

end
