class CamerasController < ApplicationController
  before_action :set_camera, only: [:show]
  def index
    if params[:query].present?
      #sql_subquery = "name @@ :query OR address @@ :query"
      #@cameras = Camera.where(sql_subquery,query: "%#{params[:query]}%")
      @cameras = Camera.search_by_name_and_address_and_resolution(params[:query])
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


  def edit
    @camera = Camera.find(params[:id])
  end

  def update
    @camera = Camera.find(params[:id])

    if @camera.update(camera_params)
      redirect_to cameras_path, notice: "Camera updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @camera = Camera.find(params[:id])
    @camera = Camera.destroy
    redirect_to cameras_path, notice: "Camera deleted!"
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
