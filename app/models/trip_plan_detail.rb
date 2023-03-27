class TripPlanDetail < ApplicationRecord

  belongs_to :trip_plan
  has_one :review

  validates :hour, presence: true
  validates :category, presence: true
  validates :what_day, presence: true
  validates :destination, presence: true
  validates :price, presence: true

end
