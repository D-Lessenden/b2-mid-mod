class PassengersController < ApplicationController

  def destroy
    Passenger.destroy(params[:id])
    redirect_to '/flights'
  end

end
