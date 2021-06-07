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
          {
            event: "new_message",
            message: @message.content,
            html: render_to_string(partial: "message", locals: { message: @message })
          }.to_json
        )
      elsif @message.message_type == "topic"
        RoomChannel.broadcast_to(
          @room,
          {
            event: "new_topic_announce",
            html: render_to_string(partial: "messages/announce", locals: { message: @message })
          }.to_json
        )
      else
        RoomChannel.broadcast_to(
          @room,
          {
            event: "new_survey_announce",
            html: render_to_string(partial: "messages/announce", locals: { message: @message })
          }.to_json
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
