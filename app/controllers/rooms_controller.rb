class RoomsController < ApplicationController
  before_action :set_room, only: :show
  before_action :set_entities, only: :show

  def index
    @rooms = policy_scope Room
  end

  def show
    @ongoing_survey = @room.surveys.find_by(status: "open")
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def set_entities
    @survey = Survey.new
    @message = Message.new
  end
end
