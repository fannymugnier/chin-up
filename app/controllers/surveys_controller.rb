class SurveysController < ApplicationController
  def create
    @survey = Survey.new(survey_params)
    @room = Room.find(params[:room_id])
    @survey.room = @room
    @survey.author = current_user
    if @survey.save
      attach_images
      @message = Message.create(room: @room, content: 'a lancé un nouveau sondage.', message_type: 'announce', user: current_user)
      RoomChannel.broadcast_to(
        @room,
        {
          event: "new_survey_announce",
          html: render_to_string(partial: "messages/announce", locals: { message: @message }),
          voteHtml: render_to_string(partial: "vote", locals: { survey: @survey, answer: Answer.new })
        }.to_json
      )
      redirect_to room_path(@room)
    else
      render "rooms/show"
    end
  end

  private

  def attach_images
    file1 = URI.open(
      params.dig('survey', 'url_first_image')
    )
    @survey.first_photo.attach(io: file1, filename: params.dig('survey', 'first_proposition'), content_type: file1.meta['content-type'] )
    file2 = URI.open(
      params.dig('survey', 'url_second_image')
    )
    @survey.second_photo.attach(io: file2, filename: params.dig('survey', 'second_proposition'), content_type: file2.meta['content-type'] )
  end

  def survey_params
    params.require(:survey).permit(:title, :first_proposition, :second_proposition, :first_photo, :second_photo)
  end
end
