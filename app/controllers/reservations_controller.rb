class ReservationsController < ApplicationController
<<<<<<< HEAD
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

=======
  before_action :set_camera, only: %i[new create]
>>>>>>> 30a548b4fbe7a54df4b03ae4311a641f934f95f0
  def new
    @reservation = Reservation.new

  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.camera = @camera
    @reservation.user = current_user
    if @reservation.save
      redirect_to cameras_path, notice: 'Reservation was successfully created.'
    else
      render :new, status: :unprocessable_entity, alert: 'Something went wrong'
    end
  end

  private

  def set_camera
    @camera = Camera.find(params[:camera_id])
  end

<<<<<<< HEAD
  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :num_cameras)
  end
=======
  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end

>>>>>>> 30a548b4fbe7a54df4b03ae4311a641f934f95f0
end
