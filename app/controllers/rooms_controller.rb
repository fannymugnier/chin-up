class RoomsController < ApplicationController
  before_action :set_room, only: :show
  before_action :set_entities, only: :show

  def index
    @rooms = Room.all
  end

  def show
    @ongoing_survey = @room.surveys.find_by(status: "open")
    @closed_surveys = @room.surveys.where(status: "closed")
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def set_entities
    @survey = Survey.new
    @message = Message.new
    @answer = Answer.new
  end
end
