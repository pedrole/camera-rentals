class ReservationsController < ApplicationController
  before_action :set_camera, only: %i[new create]
  def new
    @reservation = Reservation.new

  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.camera = @camera
    @reservation.user = current_user
    if @reservation.save
      redirect_to @reservation, notice: 'Reservation was successfully created.'
    else
      render :new, status: :unprocessable_entity, alert: 'Something went wrong'
    end
  end
  
  def show
    @reservation = Reservation.find(params[:id])
  end  

  private

  def set_camera
    @camera = Camera.find(params[:camera_id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end

end
