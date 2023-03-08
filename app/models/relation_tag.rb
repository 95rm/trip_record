class RelationTag < ApplicationRecord

  belongs_to :trip_plan
  belongs_to :tag
  validates :trip_plan_id, presence: true
  validates :tag_id, presence: true

end
