class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_one_attached :profile_image

  def get_profile_image(width, height)
   profile_image.variant(resize_to_limit: [width, height]).processed
  end


end
