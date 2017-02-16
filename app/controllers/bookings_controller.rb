class BookingsController < ApplicationController

	def new
		@flight = Flight.find(params[:flight][:id])
		@booking = @flight.bookings.build
		@number_of_passengers = params[:flight][:number_of_passengers].to_i
		@number_of_passengers.times {@booking.passengers.build}
	end

	def create
		@booking = Booking.new(booking_params)
		@booking.passengers.each do |passenger|
			@passenger = Passenger.find_by_email(passenger.email)
			unless @passenger.nil?
				@booking.passengers.delete(passenger)
				@booking.passengers << @passenger
			end
		end
		if @booking.save
			flash[:success] = "Flight booked!"
			redirect_to booking_path(@booking)
		else
			byebug
			redirect_to root_path
		end
	end

	def show
		@booking = Booking.find(params[:id])
	end

	private

	def booking_params
		params.require(:booking).permit(:flight_id, passengers_attributes: [:first_name, :last_name, :email])
	end
end
