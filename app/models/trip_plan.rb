class TripPlan < ApplicationRecord

  has_one_attached :image

  belongs_to :user
  has_many :likes
  has_many :comments
  has_many :trip_plan_details
  has_many :reviews
  has_many :relation_tags

  def get_image(width, height)
   image.variant(resize_to_limit: [width, height]).processed
  end

end
