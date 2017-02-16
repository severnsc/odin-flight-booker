Airport.create!(city: "Ft. Lauderdale", state: "FL", code: "FLL")
Airport.create!(city: "Palm Beach", state: "FL", code: "PBI")
Airport.create!(city: "Miami", state: "FL", code: "MIA")
Airport.create!(city: "New York", state: "NY", code: "JFK")
Airport.create!(city: "Boston", state: "MA", code: "BOS")

30.times do |n|
	Flight.create!(dept_airport_id: rand(1..5), arrival_airport_id: rand(1..5), dept_datetime: Time.zone.now, arrival_datetime: Time.zone.now + 2.hours, duration: 2.0)
end