class Review < ApplicationRecord

  belongs_to :trip_plan_detail

  #レビューの写真投稿の条件
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      get_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    get_image.variant(resize_to_limit: [width, height]).processed
  end

end
