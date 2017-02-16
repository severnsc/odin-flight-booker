class Flight < ApplicationRecord
	attr_accessor :number_of_passengers
	validates :dept_airport_id, presence: true
	validates :arrival_airport_id, presence: true
	validates :dept_datetime, presence: true
	validates :arrival_datetime, presence: true
	validates :duration, presence: true
	belongs_to :dept_airport, class_name: "Airport"
	belongs_to :arrival_airport, class_name: "Airport"
	has_many :bookings
	has_many :passengers, through: :bookings

	private

	def dept_date_to_text
		dept_datetime.strftime("%m/%d/%Y")
	end

	def self.get_results(params_hash)
		Flight.where(dept_airport_id: params_hash[:dept_airport]).where(arrival_airport_id: params_hash[:arrival_airport]).where('dept_datetime BETWEEN ? AND ?', DateTime.strptime(params_hash[:dept_datetime], '%m/%d/%Y').beginning_of_day, DateTime.strptime(params_hash[:dept_datetime], '%m/%d/%Y').end_of_day)
	end
end
