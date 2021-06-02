class RoomsController < ApplicationController
  before_action :set_room, only: :show
  before_action :set_entities, only: :show

  def index
    @rooms = policy_scope Room
  end

  def show; end

  private

  def set_room
    @room = Room.find(params[:id])
    authorize @room
  end

  def set_entities
    @survey = Survey.new
    @message = Message.new
  end
end
