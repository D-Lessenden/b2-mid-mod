require 'rails_helper'
RSpec.describe 'Flights' do
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
      FlightPassenger.create!(flight_id: @flight2.id, passenger_id: @passenger2.id )
      FlightPassenger.create!(flight_id: @flight3.id, passenger_id: @passenger3.id )
      FlightPassenger.create!(flight_id: @flight3.id, passenger_id: @passenger4.id )

    end

    it 'displays all fligh t numbers' do
      visit '/flights'

      expect(page).to have_content(@flight1.number)
      expect(page).to have_content(@flight2.number)
      expect(page).to have_content(@flight3.number)
    end

    it 'displays all names of all passengers for every flight' do
      visit '/flights'

      expect(page).to have_content(@passenger1.name)
      expect(page).to have_content(@passenger2.name)
      expect(page).to have_content(@passenger3.name)
      expect(page).to have_content(@passenger4.name)
    end

    it 'has a link to remove passengers' do
      visit '/flights'
      expect(page).to have_link('Remove Passenger')
      click_link('Remove Passenger', match: :first)
      expect(current_path).to eq("/flights")
      expect(page).to_not have_content(@passenger1.name)
      expect(page).to have_content(@passenger2.name)
      expect(page).to have_content(@passenger3.name)
      expect(page).to have_content(@passenger4.name)
    end

  end
end
