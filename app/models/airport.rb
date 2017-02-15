class Airport < ApplicationRecord
	before_save :upcase_state
	validates :city, presence: true
	validates :state, presence: true, length: {maximum: 2}
	validates :code, presence: true, length: {maximum: 3}
	has_many :departing_flights, class_name: "Flight", foreign_key: "dept_airport_id"
	has_many :arriving_flights, class_name: "Flight", foreign_key: "arrival_airport_id"

	private

	def upcase_state
		state.upcase!
	end
end
