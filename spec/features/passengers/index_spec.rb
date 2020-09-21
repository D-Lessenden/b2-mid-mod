require 'rails_helper'
RSpec.describe 'Passengers' do
  describe 'As a visitor' do
    before :each do
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
    end

    it 'it has all passenger names, and next to each name I see number of flights that they have' do
      visit "/passengers"
      expect(page).to have_content(@passenger1.name)
      expect(page).to have_content(@passenger1.flights.count)

      expect(page).to have_content(@passenger2.name)
      expect(page).to have_content(@passenger2.flights.count)

      expect(page).to have_content(@passenger3.name)
      expect(page).to have_content(@passenger3.flights.count)

      expect(page).to have_content(@passenger4.name)
      expect(page).to have_content(@passenger4.flights.count)

    end
  end
end
