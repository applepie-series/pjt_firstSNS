class RoomsController < ApplicationController
  before_action :logged_in_user

  def show
    @room = Room.find(params[:id])
    if Entry.where(user_id: current_user, room_id: @room.id).present?
      @messages = @room.messages
      @message = Message.new
      @entries = @room.entries
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def create
    @room = Room.create
    active_entry = Entry.create(user_id: current_user.id, room_id: @room.id)
    passive_entry = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id))
    redirect_to "/rooms/#{@room.id}"
  end
end
