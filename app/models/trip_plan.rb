class TripPlan < ApplicationRecord

  has_one_attached :image

  belongs_to :user
  has_many :likes
  has_many :comments
  has_many :trip_plan_details
  has_many :reviews
  has_many :relation_tags, dependent: :destroy
  has_many :tags,through: :relation_tags

  def get_image(width, height)
   image.variant(resize_to_limit: [width, height]).processed
  end

#ransackを使った検索機能
  def self.ransackable_attributes(auth_object = nil)
    ["budget", "created_at", "first_day", "first_month", "id", "number_day", "second_day", "second_month", "status", "title_name", "updated_at", "user_id"]
  end
end
