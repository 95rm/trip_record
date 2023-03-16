class TripPlanDetail < ApplicationRecord

  belongs_to :trip_plan
  has_one :review

end
