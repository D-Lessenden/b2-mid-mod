class PassengersController < ApplicationController

  def index
    @passengers = Passenger.all
  end

  def destroy
    Passenger.destroy(params[:id])
    redirect_to '/flights'
  end

end
