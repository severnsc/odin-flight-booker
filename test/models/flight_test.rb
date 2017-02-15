require 'test_helper'

class FlightTest < ActiveSupport::TestCase
 
	def setup
		@flight = Flight.new(dept_airport: airports(:FLL), arrival_airport: airports(:MIA), dept_datetime: Time.zone.now, arrival_datetime: Time.zone.now + 2.hours, duration: 2.0)
	end

	test "should be valid" do
		assert @flight.valid?
	end

	test "should have a dept airport" do
		@flight.dept_airport_id = " "
		assert_not @flight.valid?
	end

	test "should have an arrival airport" do
		@flight.arrival_airport_id = " "
		assert_not @flight.valid?
	end

	test "should have a dept_datetime" do
		@flight.dept_datetime = " "
		assert_not @flight.valid?
	end

	test "should have an arrival datetime" do
		@flight.arrival_datetime = " "
		assert_not @flight.valid?
	end

	test "should have a duration" do
		@flight.duration = " "
		assert_not @flight.valid?
	end
end
