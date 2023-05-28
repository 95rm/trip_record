class Review < ApplicationRecord

  belongs_to :trip_plan_detail
  has_one_attached :image

  validates :review, presence: true
  validates :image, presence: true

  #レビューの写真投稿の条件
  def get_image(width,height)
    if id.nil?
      return 'no_image.jpg'
    end
    unless image.attached?
      file_path = Rails.root.join('app/javascript/images/no_image.jpg')
      # file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
      'no_image.jpg'
    else
      image.variant(resize_to_limit: [width, height]).processed
    end
  end

end
