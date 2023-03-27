class TripPlan < ApplicationRecord
  attribute :tag_list_to_s
  has_one_attached :image

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :trip_plan_details
  has_many :relation_tags, dependent: :destroy
  has_many :tags,through: :relation_tags

  validates :title_name, presence: true
  validates :first_day, presence: true
  validates :second_day, presence: true
  validates :number_day, presence: true
  validates :budget, presence: true

#タグ検索機能実装コード
  after_initialize do
    self.tag_list_to_s = self.tags.pluck(:name_tag).join(" ")
  end

#ransackを使ったキーワード検索機能
  def self.ransackable_attributes(auth_object = nil)
    ["budget", "created_at", "first_day", "first_month", "id", "number_day", "second_day", "second_month", "status", "title_name", "updated_at", "user_id"]
  end

#タグ機能実装コード
 def save_tag(sent_tags)
   #byebug
   sent_tags = sent_tags.split(/\p{blank}/)
   current_tags = self.tags.pluck(:name_tag) unless self.tags.nil?
   old_tags = current_tags - sent_tags
   new_tags = sent_tags - current_tags

   old_tags.each do |old|
    self.tags.delete Tag.find_by(name_tag: old)
   end

   new_tags.each do |new|
    new_post_tag = Tag.find_or_create_by(name_tag: new)
    self.tags << new_post_tag
   end
 end

#いいね機能実装コード
 def favorited_by?(user)
  likes.exists?(user_id: user.id)
 end

 #投稿の公開・非公開機能実装コード
 scope :published, -> {where(status: true)}
 scope :unpublished, -> {where(status: false)}

end
