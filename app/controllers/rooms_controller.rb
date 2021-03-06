class RoomsController < ApplicationController
  before_action :set_room, only: :show
  before_action :set_entities, only: :show

  def index
    @rooms = Room.all
    if params[:query].present?
      sql = " \
    rooms.name @@ :query \
    OR interests.name @@ :query \
    "
      @rooms = Room.joins(:interests).where(sql, query: "%#{params[:query]}%").distinct
    else
      @rooms = Room.all
    end
  end

  def show
    @ongoing_survey = @room.surveys.where(status: "open")
    @closed_surveys = @room.surveys.where(status: "closed")
    @users_in_room = []
    @room.online_users.each do |user|
      @users_in_room << User.find(user)
    end
    @topics = @room.messages.where(message_type: 'topic')
    @topics_pending = @topics.select do |topic|
      topic.created_at > Time.zone.now - 10.minutes
    end
    @end_timer_in_seconds = ((@topics_pending.first.created_at + 10.minutes) - Time.zone.now).round unless @topics_pending.empty?
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
