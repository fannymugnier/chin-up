class RoomsController < ApplicationController
  before_action :set_room, only: :show
  before_action :set_entities, only: :show

  def index
    @rooms = Room.all
  end

  def show
    all_messages = Message.where(room: @room)
    all_surveys = Survey.where(room: @room)
    all_topics = Topic.where(room: @room)
    @entities = (all_messages + all_surveys + all_topics).sort_by(&:created_at)
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
