class CreateCameras < ActiveRecord::Migration[7.1]
  def change
    create_table :cameras do |t|
      t.string :name
      t.integer :optical_zoom
      t.float :price_per_day
      t.string :address
      t.float :resolution
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :cameras, :name, unique: true
  end
end
