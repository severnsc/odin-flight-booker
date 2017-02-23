class PassengerMailer < ApplicationMailer
	default from: 'notifications@example.com'

	def thank_you_email(user, booking)
		@user = user
		@booking = booking
		mail(to: @user.email, subject: "Booking confirmed")
	end
end
