class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :camera

  validates :start_date, :end_date, :num_cameras, presence: true
  validate :end_date_after_start_date

  private

 def end_date_after_start_date
  error.add(:end_date, "must be after the start date") if end_date < start_date
 end
end
