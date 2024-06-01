class Camera < ApplicationRecord
  belongs_to :user
  validates :name, :price_per_day, presence: true
end
