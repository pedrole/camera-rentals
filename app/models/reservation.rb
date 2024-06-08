class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :camera
  validates :start_date, :end_date, presence: true

  before_save :set_total_price

  private

  def set_total_price
    self.total_price = (end_date - start_date).to_i * camera.price_per_day
  end
end
