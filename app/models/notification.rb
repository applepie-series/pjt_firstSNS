class Notification < ApplicationRecord
  validates :visitor_id, :visited_id, :action, presence: true

  default_scope -> { order(created_at: :desc) }
  belongs_to :visitor, class_name: "User"
  belongs_to :visited, class_name: "User"
  belongs_to :micropost, optional: true
  belongs_to :comment, optional: true
end
