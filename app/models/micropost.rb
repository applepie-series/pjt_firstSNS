class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validate :images_size
  has_many_attached :images

  private
    def images_size
      if images.size > 5.megabytes
        errors.add(:images, "5MB以下の画像を選択してください")
      end
    end
end