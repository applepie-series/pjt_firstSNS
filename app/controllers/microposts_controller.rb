class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :new]
  before_action :correct_user,   only: :destroy

  def new
    if logged_in?
      @micropost  = current_user.microposts.build
    end
  end

  def show
    @micropost = Micropost.find(params[:id])
    @user = @micropost.user
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "投稿が完了しました。"
      redirect_to home_url
    else
      @feed_items = current_user.feed.paginate(page: params[:page])
      @micropost = current_user.microposts.build(micropost_params)
      render "new"
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "投稿を削除しました。"
    redirect_to request.referrer || home_url
  end
  private

    def micropost_params
      params.require(:micropost).permit(:content, :image)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to home_url if @micropost.nil?
    end
end