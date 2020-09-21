# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@airline1 = Airline.create!(name: "Airline1")
@flight1 = Flight.create!(number: "1234", airline_id: @airline1.id)
@flight2 = Flight.create!(number: "6789", airline_id: @airline1.id)
@flight3 = Flight.create!(number: "0192", airline_id: @airline1.id)

@passenger1 = Passenger.create!(name: "pass1", age: 30)
@passenger2 = Passenger.create!(name: "pass2", age: 30)
@passenger3 = Passenger.create!(name: "pass3", age: 30)
@passenger4 = Passenger.create!(name: "pass4", age: 30)


FlightPassenger.create!(flight_id: @flight1.id, passenger_id: @passenger1.id )
FlightPassenger.create!(flight_id: @flight2.id, passenger_id: @passenger1.id )

FlightPassenger.create!(flight_id: @flight1.id, passenger_id: @passenger2.id )
FlightPassenger.create!(flight_id: @flight2.id, passenger_id: @passenger2.id )
FlightPassenger.create!(flight_id: @flight3.id, passenger_id: @passenger2.id )

FlightPassenger.create!(flight_id: @flight3.id, passenger_id: @passenger3.id )

FlightPassenger.create!(flight_id: @flight3.id, passenger_id: @passenger4.id )
