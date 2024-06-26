class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.date :start_date
      t.date :end_date
      t.decimal :total_price
      t.references :user, null: false, foreign_key: true
      t.references :camera, null: false, foreign_key: true

      t.timestamps
    end
  end
end
