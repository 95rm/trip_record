class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :trip_plan
  
  validates :comment_content, presence: true, length: { maximum: 255 }
end
