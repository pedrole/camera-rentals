class Camera < ApplicationRecord
  include PgSearch::Model
  belongs_to :user
  validates :name, :price_per_day, presence: true
  validates :name, uniqueness: true
  validates :address, presence: true

  pg_search_scope :search_by_name_and_address_and_resolution,
                  against: %i[name address resolution],
                  using: {
                    tsearch: { prefix: true }
                  }
end
