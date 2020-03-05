class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :edit, :update, :destroy,
                                        :following, :followers]
  before_action :correct_user,   only: [:edit, :update, :reset]
  before_action :admin_user,     only: :destroy

  def index
    @search = params[:search]
    if @search
      @users = User.paginate(page: params[:page]).search(@search)  
    else
      @users = User.paginate(page: params[:page])
    end
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
    @title = "#{@user.user_name}の投稿 #{@user.microposts.count}"
    # ダイレクトメッセージリンク
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @RoomPresent = Room.find(cu.room_id)
          end
        end
      end
    end
    unless @isRoom
      @room = Room.new
      @entry = Entry.new
    end
  end

  def new
    @user = User.new
  end
  
  def edit
    @user = User.find(params[:id])
    @title = "ユーザー編集"
  end

  def update
    @user = User.find(params[:id])
    if params[:user][:nowpassword].blank?
      if @user.update_attributes(user_params)
        flash[:success] = "プロフィールを更新しました。"
        redirect_to @user
      else
        render 'edit'
      end
    else
      if @user.authenticate(params[:user][:nowpassword])
        @user.update_attributes(password_params)
        flash[:success] = "パスワードを更新しました。"
        redirect_to @user
      else
        flash.now[:danger] = '更新に失敗しました。パスワードの内容を確認し再度入力して下さい。'
        render 'reset'
      end
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "ユーザーを削除しました"
    redirect_to users_url
  end

  def following
    @title = "フォロー"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "フォロワー"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  def likes
    @title = "お気に入り一覧"
    @microposts = current_user.like_posts.paginate(page: params[:page])
    @user  = User.find(params[:id])
    # ダイレクトメッセージリンク
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @RoomPresent = Room.find(cu.room_id)
          end
        end
      end
    end
    unless @isRoom
      @room = Room.new
      @entry = Entry.new
    end
    render 'show'
  end

  def reset
    @title = "パスワード再設定"
    @user = User.find(params[:id])
  end

  private

    def password_params
      params.require(:user).permit(:password, :password_confirmation)
    end
    def user_params
      params.require(:user).permit(
        :name, :email, :introduction, :web, :tel, :username, :sex, :password, :password_confirmation)
    end

    # beforeアクション

    # 正しいユーザーかどうか確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless 
      current_user?(@user)
    end
    # 管理者かどうか確認
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
