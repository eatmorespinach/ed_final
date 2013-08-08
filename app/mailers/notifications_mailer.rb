class NotificationsMailer < ActionMailer::Base
	default :from => "staytraders@gmail.com"
	default :to => "staytraders@gmail.com"

	def profile_contact(message, user, profile)
		@message = message
		@user = user
		@profile = profile
		mail(to: @profile.user.email, subject: "StayTraders! #{@user.email} has contacted you :-)")
	end

	def listing_contact(message, user, listing)
		@message = message
		@user = user
		@listing = listing
		mail(to: @listing.user.email, subject: "StayTraders! #{@user.email} has contacted you :-)")
	end

	def registration_confirmation(user)
		@user = user
		mail(to: @user.email, subject: "StayTraders: Thanks for joining :-)")
	end

	def reset_password_email(user)
		@user = user
		@url = edit_password_reset_url(user.reset_password_token)
		mail(to: @user.email, subject: "StayTraders: Password Reset Request")
	end

	def listing_approved(listing)
		@listing = listing
		@user = listing.user
		mail(to: @user.email, subject: "StayTraders: Hosting Approved!")
	end

	def listing_created(listing)
		@listing = listing
		@user = listing.user
		mail(subject: "StayTraders #{@user.email} created a listing")
	end 
end