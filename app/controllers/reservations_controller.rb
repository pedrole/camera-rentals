class ReservationsController < ApplicationController
  before_action :set_reservation, only [:edit :update]

  def show
    @reservation
  end

  def edit
  end

  def update
    if @reservation.update(reservation_params)
      redirect_to @reservation, notice: 'reservation updated successfully'
    else
      render :edit
    end
  end

  def new
    @reservation = Reservation.new
    @camera = Camera.find(params[:camera_id])
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :num_cameras)
  end
end
