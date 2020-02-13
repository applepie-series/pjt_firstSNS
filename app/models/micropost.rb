class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validate :images_size
  has_many_attached :images
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user


  def like(user)
    likes.create(user_id: user.id)
  end

  def unlike(user)
    likes.find_by(user_id: user.id).destroy
  end

  # 現在のユーザーがlikeしていたらtrueを返す
  def like?(user)
    like_users.include?(user)
  end

  private
    def images_size
      if images.size > 5.megabytes
        errors.add(:images, "5MB以下の画像を選択してください")
      end
    end
end