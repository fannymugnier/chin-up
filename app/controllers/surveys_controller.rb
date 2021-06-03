class SurveysController < ApplicationController
  def create
    @survey = Survey.new(survey_params)
    @room = Room.find(params[:room_id])
    @survey.room = @room
    @survey.author = current_user
    if @survey.save
      @message = Message.create(room: @room, content: 'a lancé un nouveau sondage.', message_type: 'announce', user: current_user)
      RoomChannel.broadcast_to(
        @room,
        render_to_string(partial: "messages/announce", locals: { message: @message })
      )
      redirect_to room_path(@room, anchor: "message-#{@message.id}")
    else
      render "rooms/show"
    end
  end

  private

  def survey_params
    params.require(:survey).permit(:title, :first_proposition, :second_proposition, :first_photo, :second_photo)
  end
end
