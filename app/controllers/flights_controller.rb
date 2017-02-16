class FlightsController < ApplicationController

	def index
			@flights = Flight.all
			@airports = Airport.all
			@flight = Flight.new
			if params[:flight].blank? 
				@flight_results = nil 
			else
				@flight_results = Flight.get_results(flight_params)
				@number_of_passengers = params[:flight][:number_of_passengers]
			end
	end

	private

	def flight_params
		params.require(:flight).permit(:dept_airport, :arrival_airport, :number_of_passengers, :dept_datetime)
	end
end
