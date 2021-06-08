class RoomChannel < ApplicationCable::Channel
  def subscribed
    a = "subscribed section"
    ap a
    room = Room.find(params[:id])
    room.online_users = []
    connection.server.connections.each do |c|
      ap c.current_user
      if room.online_users.exclude?(c.current_user.id)
        room.online_users << c.current_user.id
        room.save!
      end
    end
    stream_for room
  end

  def unsubscribed
    a = "unsubscribed section"
    ap a
    ap current_user
    room = Room.find(params[:id])
    room.online_users.delete_at(room.online_users.index(current_user.id))
  end
end
