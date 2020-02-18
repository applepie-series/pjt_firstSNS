class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # フォローしてるユーザーのフィード
  def feed
    Micropost.where("user_id IN (:following_ids) OR user_id = :user_id",
     following_ids: following_ids, user_id: id)
  end
end
