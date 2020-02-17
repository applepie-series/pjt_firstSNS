class MessageController < ApplicationController
  before_action :logged_in_user

  def create
    @message = current_user.messages.build(message_params)
    if Entrie.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
      @message = current_user.messages.build(message_params)
      @message.save
    else
      flash[:alert] = "メッセージの送信に失敗しました。"
    end
    redirect_to "/rooms/#{@message.room_id}"
  end

  private
    def message_params
      params.require(:message).parmit(:room_id, :message)
    end
end
