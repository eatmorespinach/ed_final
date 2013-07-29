class NotificationsMailer < ActionMailer::Base
	default :from => "support@staytraders.com"
	default :to => "support@staytraders.com"

	def profile_contact(message, user, profile)
		@message = message
		@user = user
		@profile = profile
		mail(to: @profile.user.email, subject: "[StayTraders] Contact from #{@user.email} ")
	end

	def registration_confirmation(user)
		@user = user
		mail(to: @user.email, subject: "StayTraders: Thank You for Registering")
	end
end