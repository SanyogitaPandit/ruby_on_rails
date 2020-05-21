# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Airport.delete_all
Flight.delete_all
Booking.delete_all

airports = [
  "SFO",
  "NYC",
  "BWI",
  "DEN",
]

airports.each do |airport_code|
  Airport.create(code: airport_code)
end

flight_duration = {
  "SFO_NYC" => 8.hours, "SFO_BWI" => 7.hours, 
  "SFO_DEN" => 3.hours, "NYC_SFO" => 8.hours, 
  "NYC_BWI" => 1.hour, "NYC_DEN" => 6.hours,
  "BWI_SFO" => 7.hours, "BWI_NYC" => 1.hour,
  "BWI_DEN" => 6.hours, "DEN_SFO" => 3.hours,
  "DEN_NYC" => 6.hours, "DEN_BWI" => 6.hours
}

Airport.all.each do |origin|
  3.times do 
    Airport.all.each do |destination|
      next if origin == destination
      duration = flight_duration["#{origin.code}_#{destination.code}"]
      start = Time.now + rand(10000000)
      Flight.create(from_airport_id: origin.id, to_airport_id: destination.id, sdt: start, duration: duration)
    end
  end
end

Flight.all.each do |flight|
    Booking.create(flight_id: flight.id, passanger_id: 1)
end