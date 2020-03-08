class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    create_notification_follow!(current_user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  private 

    # フォロー通知の作成
    def create_notification_follow!(current_user)
      temp = Notification.where("visitor_id = ?", current_user.id ).where("action IN (?) AND visited_id = ?", "follow", @user.id )
      if temp.blank?
        notification = Notification.new(
          visitor_id: current_user.id,
          visited_id: @user.id,
          action: "follow"
        )
        notification.save if notification.valid?
      end
    end
end