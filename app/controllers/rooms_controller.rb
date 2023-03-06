class RoomsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  before_action :set_room, only: %i[show destroy]

  def index
    @new_room = Room.new
    @rooms = Room.all

    @online_users = User.where(status: "online")
    @offline_users = User.where(status: "offline")
  end

  def create
    @new_room = current_user&.rooms&.build

    if @new_room&.save
      @new_room.broadcast_append_to :rooms
    end
  end

  def show
    @messages = @room.messages
    @new_message = current_user&.messages&.build
  end

  def destroy
    @room.broadcast_remove_to('rooms', target: "room_#{@room.title}")

    @room.destroy

    redirect_to root_path
  end

  private

  def set_room
    @room = Room.find_by!(title: params[:title])
  end
end
