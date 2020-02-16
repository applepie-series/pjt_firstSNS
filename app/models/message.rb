class Message < ApplicationRecord
  validate :content, presence: true
  belongs_to :user
  belongs_to :room
end
