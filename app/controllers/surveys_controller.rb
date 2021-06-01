class SurveysController < ApplicationController
  def create
    @survey = Survey.new(survey_params)
    @room = Room.find(params[:room_id])
    if @survey.save
      redirect_to room_path(@room)
    else
      render "rooms/show"
    end
  end

  private

  def survey_params
    params.require(:survey).permit(:title, :first_proposition, :second_proposition)
  end
end
