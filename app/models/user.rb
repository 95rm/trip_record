class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_one_attached :profile_image

  scope :actives, -> { where(is_deleted: false) }

  has_many :trip_plans, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_trip_plans, through: :likes, source: :trip_plan
  has_many :comments, dependent: :destroy

  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following_users, through: :follower, source: :followed, dependent: :destroy #自分がフォローしている人
  has_many :follower_users, through: :followed, source: :follower, dependent: :destroy #自分をフォローしている人

  #ユーザーをフォローする
  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  #ユーザーのフォローを外す
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  #フォローしていればtrueを返す
  def following?(user)
    following_users.include?(user)
  end

  #プロフィール画像
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

  #退会したユーザーがログインできないようにする処理
  def active_for_authentication?
    super && (is_deleted == false)
  end


end
