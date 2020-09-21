class FlightpassengersController < ApplicationController
  def destroy
    FlightPassenger.destroy(params[:id])
    redirect_to '/flights'
  end
end
