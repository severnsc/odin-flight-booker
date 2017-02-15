class Airport < ApplicationRecord
	before_save :upcase_state
	validates :city, presence: true
	validates :state, presence: true, length: {maximum: 2}
	validates :code, presence: true, length: {maximum: 3}

	private

	def upcase_state
		state.upcase!
	end
end
