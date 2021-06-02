class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @room = Room.find(params[:room_id])
    @message.user = current_user
    @message.room = @room
    if @message.save
      RoomChannel.broadcast_to(
        @room,
        render_to_string(partial: "message", locals: { message: @message })
      )
      redirect_to room_path(@room, anchor: "message-#{@message.id}")
    else
      render 'rooms/show'
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :message_type)
  end
end
