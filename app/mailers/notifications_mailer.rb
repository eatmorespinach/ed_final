class NotificationsMailer < ActionMailer::Base
	default :from => "support@staytraders.com"
	default :to => "support@staytraders.com"

	def listing_contact(message, user, listing)
		@message = message
		@user = user
		@listing = listing
		mail(to: @listing.user.email, subject: "[StayTraders] Contact from #{@user.email} about #{@listing.title} ")
	end

	def registration_confirmation(user)
		@user = user
		mail(to: @user.email, subject: "StayTraders: Thank You for Registering")
	end
end