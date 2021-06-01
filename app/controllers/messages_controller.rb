class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @room = Room.find(params[:room_id])
    @message.user = current_user
    @message.room = @room
    if @message.save
      redirect_to room_path(@room, anchor: "message-#{@message.id}")
    else
      render 'room/show'
    end
  end

  private

  def message_params
    params.require(:create).permit(:messages)
  end
end
