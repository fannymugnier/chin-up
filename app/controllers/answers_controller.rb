class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)
    @answer.survey_id = params[:survey_id].to_i
    @answer.user = current_user
    if @answer.save!
      redirect_to room_path(@room)
    else
      render 'rooms/show'
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:selected_proposition)
  end
end
