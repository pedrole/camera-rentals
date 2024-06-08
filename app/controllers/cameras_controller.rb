class CamerasController < ApplicationController
  before_action :set_camera, only: [:show]
  def index

    if params[:query].present?
      @query = params[:query]
      @cameras = Camera.where("name LIKE ?", "%#{params[:query]}%")
      # Preventing SQL Injection and Database error for
      # unknown characters
    else
      @cameras = Camera.all
    end
  end

  def new
    @camera = Camera.new
  end

  def create
    @camera = Camera.new(camera_params)
    @camera.user = current_user

    if @camera.save
      redirect_to cameras_path, notice: "Camera created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show 
    @camera 
  end
  
  private

  def set_camera
    @camera = Camera.find(params[:id])
  end
  
  def camera_params
    params.require(:camera).permit(:name, :optical_zoom, :address, :year, :resolution, :price_per_day)
  end
end
