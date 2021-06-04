class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @room = Room.find(params[:room_id])
    @message.message_type = params[:message_type]
    @message.user = current_user
    @message.room = @room
    if @message.save
      if @message.message_type == "message"
        RoomChannel.broadcast_to(
          @room,
          render_to_string(partial: "message", locals: { message: @message })
        )
      else
        RoomChannel.broadcast_to(
          @room,
          render_to_string(partial: "messages/announce", locals: { message: @message })
        )
      end
      redirect_to room_path(@room)
    else
      render 'rooms/show'
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
