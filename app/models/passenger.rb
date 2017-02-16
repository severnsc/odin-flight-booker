class Passenger < ApplicationRecord
	before_save :downcase_email
	has_many :bookings
	has_many :flights, through: :bookings
	validates :first_name, presence:true, length: {maximum: 30}
	validates :last_name, presence: true, length: {maximum: 30}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: {maximum: 255},
					  format: { with: VALID_EMAIL_REGEX},
					  uniqueness: {case_sensitive: false}

	private

	def downcase_email
		email.downcase!
	end
end
