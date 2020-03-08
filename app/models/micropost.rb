class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validate :image_size
  has_one_attached :image
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy


  def like(user)
    likes.create(user_id: user.id)
    create_notification_like!(user)
  end

  def unlike(user)
    likes.find_by(user_id: user.id).destroy
  end

  # 現在のユーザーがlikeしていたらtrueを返す
  def like?(user)
    like_users.include?(user)
  end

  # 投稿いいねの通知を作成
  def create_notification_like!(current_user)
    # 良いねされてるか検索
    temp = Notification.where("visitor_id = ? and visited_id = ? and micropost_id = ? and action = ?",current_user.id, user_id, id, "like")
    # いいねされてなければ通知を作成
    if temp.blank?
      notification = current_user.active_notifications.new(
        micropost_id: id,
        visited_id: user_id,
        action: "like"
      )
      # ユーザーが自分自身に良いねをした場合通知は送らない
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

  def self.search(search)
    where(['content LIKE ?', "%#{search}%"])
  end

  private
    def image_size
      if image.attached?
        if image.byte_size > 5.megabytes
          errors.add(:content, "5MB以下の画像を選択してください")
        end
      else
        errors.add(:content, "画像を選択してください")
      end
    end
end