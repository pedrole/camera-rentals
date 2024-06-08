class Camera < ApplicationRecord
  belongs_to :user
  validates :name, :price_per_day, presence: true
  validates :name, uniqueness: true
  validates :address, presence: true
end
