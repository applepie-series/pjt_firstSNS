class StaticPagesController < ApplicationController

  def home
    if logged_in?
      @micropost  = current_user.microposts.build
      @search = params[:search]
      if @search
        @feed_items = Micropost.paginate(page: params[:page]).search(@search)
      else
        @feed_items = current_user.feed.paginate(page: params[:page])
      end
    else
      redirect_to(root_url)
    end
  end

  def help
  end

  def about
  end

  def contact
  end

  def runding
    
  end
end
