class RemovePassengersFromBookings < ActiveRecord::Migration[5.0]
  def change
  	change_table :bookings do |t|
  		t.remove :passenger_id
  	end

  	create_table :bookings_passengers, id: false do |t|
  		t.belongs_to :booking, index: true
  		t.belongs_to :passenger, index: true
  	end
  end
end
