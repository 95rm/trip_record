class Tag < ApplicationRecord

  has_many :relation_tags, dependent: :destroy
  has_many :trop_plans,through: :relation_tags

  validates :name_tag, uniqueness: true, presence: true

end
