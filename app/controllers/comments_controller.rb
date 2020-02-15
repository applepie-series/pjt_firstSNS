class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:success] = "コメントを投稿しました"
      create_notification_comment!(current_user, @comment.id, @comment.micropost )
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
  end

  private

    def comment_params
      params.require(:comment).permit(:content, :user_id, :micropost_id)
    end
end
