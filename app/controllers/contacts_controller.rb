class ContactsController < ApplicationController
  before_filter :require_login
  before_filter :load_profile, only: [:new, :create]
  before_filter :load_listing, only: [:new_listing, :create_listing]


  def new
  	@message = Message.new
  end

  def create  
    @message = Message.new(params_message)

  	if @message.valid?
  		NotificationsMailer.profile_contact(@message, current_user, @profile).deliver
  		redirect_to root_path, alert: "Message has been sent."
  	else
		  render 'new'
    end	
  end

  def new_listing
    @message = Message.new
  end

  def create_listing
    
    @message = Message.new(params_message)
    
    if @message.valid?
      NotificationsMailer.listing_contact(@message, current_user, @listing).deliver
      redirect_to root_path, alert: "Message has been sent!!!!!!!"
    else
      render 'new'
    end 
  end

  private

  def params_message
  	params.require(:message).permit(:subject, :body)
  end

  def load_profile
    @profile = Profile.find(params[:profile_id])
  end
    
  def load_listing
    @listing = Listing.find(params[:listing_id])
  end

end
