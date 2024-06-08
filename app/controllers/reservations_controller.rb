class ReservationsController < ApplicationController

  def new
    @reservation = Reservation.new
    @camera = Camera.find(params[:camera_id])
  end
end
