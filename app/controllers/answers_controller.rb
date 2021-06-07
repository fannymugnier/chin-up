class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)
    @answer.survey_id = params[:survey_id].to_i
    @answer.user = current_user
    @answer.save!
    broadcast_to_room
  end

  private

  def answer_params
    params.require(:answer).permit(:selected_proposition)
  end

  def broadcast_to_room
    @room = @answer.survey.room
    RoomChannel.broadcast_to(
      @room,
      {
        event: "new_vote",
        resultsHtml: render_to_string(partial: "surveys/survey_results", locals: { survey: @answer.survey })
      }.to_json
    )
  end
end
