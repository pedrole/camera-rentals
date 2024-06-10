class AddCoordinatesToCameras < ActiveRecord::Migration[7.1]
  def change
    add_column :cameras, :latitude, :float
    add_column :cameras, :longitude, :float
  end
end
