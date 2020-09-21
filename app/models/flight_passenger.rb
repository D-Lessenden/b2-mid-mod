class FlightPassenger < ApplicationRecord
  belongs_to :passenger
  belongs_to :flight

  validates_presence_of :flight_id, :passenger_id


end
