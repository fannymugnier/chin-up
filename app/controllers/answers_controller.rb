class AnswersController < ApplicationController
  before_action :set_survey, only: [:create]

  def create
    @answer = Answer.new(answer_params)
    @answer.survey = @survey
    @answer.user = current_user
    @answer.save!
    broadcast_to_room
  end

  private

  def answer_params
    params.require(:answer).permit(:selected_proposition)
  end

  def set_survey
    @survey = Survey.find(params[:survey_id])
  end

  def broadcast_to_room
    @room = @answer.survey.room
    RoomChannel.broadcast_to(
      @room,
      {
        event: "new_vote",
        data: {
          survey_id: @survey.id,
          first_proposition_count: @survey.first_proposition_count,
          second_proposition_count: @survey.second_proposition_count,
          first_proposition_percent: @survey.first_proposition_percent,
          second_proposition_percent: @survey.second_proposition_percent,
          number_of_users: @survey.room.online_users.count,
          first_proposition: @survey.first_proposition,
          second_proposition: @survey.second_proposition,
          vote_user: current_user.id
        }
      }.to_json
    )
  end
end
