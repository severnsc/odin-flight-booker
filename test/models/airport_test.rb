require 'test_helper'

class AirportTest < ActiveSupport::TestCase

	def setup
		@airport = Airport.new(city: "Ft. Lauderdale", state: "FL", code: "FLL")
	end

	test "should be valid" do
		assert @airport.valid?
	end

	test "should have city" do
		@airport.city = "  "
		assert_not @airport.valid?
	end

	test "should have state" do
		@airport.state = " "
		assert_not @airport.valid?
	end

	test "state should be 2 chars max" do
		@airport.state = "Florida"
		assert_not @airport.valid?
	end

	test "state should save as upcase" do
		state = "fl"
		@airport.state = state
		@airport.save
		assert_equal state.upcase, @airport.reload.state
	end

	test "should have code" do
		@airport.code = " "
		assert_not @airport.valid?
	end

	test "code should be 3 chars max" do
		@airport.code = "a"*6
		assert_not @airport.valid?
	end
end
