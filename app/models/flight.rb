class Flight < ApplicationRecord
	validates :dept_airport_id, presence: true
	validates :arrival_airport_id, presence: true
	validates :dept_datetime, presence: true
	validates :arrival_datetime, presence: true
	validates :duration, presence: true
	belongs_to :dept_airport, class_name: "Airport"
	belongs_to :arrival_airport, class_name: "Airport"
end
