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
        {
          event: "new_survey_announce",
          html: render_to_string(partial: "messages/announce", locals: { message: @message }),
          voteHtml: render_to_string(partial: "rooms/show_ongoing_survey", locals: { survey: @survey, answer: Answer.new }),
          survey_id: @survey.id
        }.to_json
      )
      redirect_to room_path(@room)
    else
      render "rooms/show"
    end
  end

  private

  def survey_params
    params.require(:survey).permit(:title, :first_proposition, :second_proposition, :first_photo, :second_photo)
  end
end
