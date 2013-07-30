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

	def reset_password_email(user)
		@user = user
		@url = edit_password_reset_url(user.reset_password_token)
		mail(to: @user.email, subject: "[StayTraders] Password Reset Request")
	end
end