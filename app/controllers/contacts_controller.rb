class ContactsController < ApplicationController
  before_filter :require_login, :load_profile

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

  private

  def params_message
  	params.require(:message).permit(:subject, :body)
  end

  def load_profile
    @profile = Profile.find(params[:profile_id])
  end
end
