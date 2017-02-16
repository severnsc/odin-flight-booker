class Booking < ApplicationRecord
	attr_accessor :number_of_passengers
	has_and_belongs_to_many :passengers
	belongs_to :flight
	validates :flight_id, presence: true
	accepts_nested_attributes_for :passengers
end
