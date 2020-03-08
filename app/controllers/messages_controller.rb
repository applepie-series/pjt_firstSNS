class MessagesController < ApplicationController
  before_action :logged_in_user

  def create
    if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).present? 
      @message = Message.new(message_params)
      if @message.save!
        redirect_back(fallback_location: root_path)
      else
        flash[:alert] = "メッセージの送信に失敗しました。"
        redirect_back(fallback_location: root_path)
      end
    else
      flash[:alert] = "メッセージの送信に失敗しました。"
      redirect_back(fallback_location: root_path)
    end
  end

  private
    def message_params
      params.require(:message).permit(:user_id, :room_id, :content).merge(user_id: current_user.id)
    end
end
