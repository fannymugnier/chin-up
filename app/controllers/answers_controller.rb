class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)
    @answer.survey_id = params[:survey_id].to_i
    @answer.user = current_user
    @answer.save!
    # broadcast_to_room
    respond_to do |format|
      format.js
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:selected_proposition)
  end

  def broadcast_to_room
    @room = @answer.survey.room
    RoomChannel.broadcast_to(
      @room,
      render_to_string('survey', locals: { survey: @survey })
    )
  end
end


