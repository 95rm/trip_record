class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_one_attached :profile_image

  has_many :trip_plans
  has_many :likes
  has_many :comments
  #belongs_to :フォロー機能のアソシエーション記述まだしてない

  def get_profile_image(width, height)
   profile_image.variant(resize_to_limit: [width, height]).processed
  end

#ゲストログイン機能
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
     user.password = SecureRandom.urlsafe_base64
     user.account_name = "guest"
    end

  end


end
