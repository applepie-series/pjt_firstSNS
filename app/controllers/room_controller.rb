class RoomController < ApplicationController
  before_action :logged_in_user
  
  def show
    if logged_in?
      @room = Room.new
      @rooms = current_user.rooms
      @nonrooms = Room.where(id: UserRoom.where.not(user_id: current_user.id).pluck(:id))
    end
  end
end
