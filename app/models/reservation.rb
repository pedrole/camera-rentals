class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :camera
<<<<<<< HEAD

  validates :start_date, :end_date, :num_cameras, presence: true
  validate :end_date_after_start_date

  private

 def end_date_after_start_date
  error.add(:end_date, "must be after the start date") if end_date < start_date
 end
=======
  validates :start_date, :end_date, presence: true

  before_save :set_total_price

  private

  def set_total_price
    self.total_price = (end_date - start_date).to_i * camera.price_per_day
  end
>>>>>>> 30a548b4fbe7a54df4b03ae4311a641f934f95f0
end
