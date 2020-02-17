class RoomController < ApplicationController
  before_action :logged_in_user

  def show
    @room = Room.find(params[:id])
    if Entrie.where(user_id: current_user, room_id: @room.id).present?
      @messages = @room.messages
      @message = Message.new
      @entries = @room.entries
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def create
    @room = Room.create
    @active_entrie = Entrie.create(user_id: current_user.id, room_id: @room.id)
    @passive_entrie = Entrie.create(params.require(:entrie).permit(:user_id, :room_id).merge(room_id: @room.id))
    redirect_to @room
  end

end
