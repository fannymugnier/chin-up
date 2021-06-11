class RoomChannel < ApplicationCable::Channel
  def subscribed
    room = Room.find(params[:id])
    current_user.current_rooms << room.id
    room.online_users = []
    connection.server.connections.each do |c|
      if room.online_users.exclude?(c.current_user.id) && c.current_user.current_rooms.include?(room.id)
        room.online_users << c.current_user.id
        room.save!
      end
    end
    stream_for room
  end

  def unsubscribed
    room = Room.find(params[:id])
    room.online_users.delete_at(room.online_users.index(current_user.id))
    current_user.current_rooms.delete_at(current_user.current_rooms.index(room.id))
  end
end
