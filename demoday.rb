film_cultes = Room.find_by(name: 'Films cultes')
passions_atypiques = Room.find_by(name: 'Passions atypiques')

clement =   User.find_by(username: "Clément")
joseph =    User.find_by(username: "Joseph")
juliette =  User.find_by(username: "Juliette")
fabrice =   User.find_by(username: "Fabrice")
cindy =     User.find_by(username: "Cindy")
laure =     User.find_by(username: "Laure")
pat =       User.find_by(username: "Pat")
alex =      User.find_by(username: "Alex")

events = [
  { 
    type: 'message',
    room: passions_atypiques,
    user: alex,
    message: 'Bonjour'
  },
  { 
    type: 'topic',
    room: passions_atypiques,
    user: fabrice,
    subject: 'titre de mon topic'
  },
  { 
    type: 'message',
    room: passions_atypiques,
    user: fabrice,
    message: 'Oui'
  },
  { 
    type: 'message',
    room: passions_atypiques,
    user: cindy,
    message: "C'est moi"
  },
  { 
    type: 'message',
    room: passions_atypiques,
    user: cindy,
    message: "C'est une passion pour le jeu de l'oie"
  },
  { 
    type: 'message',
    room: passions_atypiques,
    user: alex,
    message: "C'est atypique"
  }
]

events.each_with_index do |event, i|
  puts "Appuyer sur ENTREE pour envoie le message n°#{i + 1}"
  gets.chomp

  case event[:type]
  when "message"
    message = Message.create!(room: event[:room], user: event[:user], content: event[:message], message_type: 'message')
    RoomChannel.broadcast_to(
      message.room,
      {
        event: "new_message",
        message: message.content,
        html: ApplicationController.new.render_to_string(partial: "messages/message", locals: { message: message })
      }.to_json
    )
  when "topic"
    message = Message.create!(room: event[:room], user: event[:user], content: event[:subject], message_type: 'topic')
    RoomChannel.broadcast_to(
      message.room,
      {
        event: "new_topic_announce",
        content: message.content,
        html: ApplicationController.new.render_to_string(partial: "messages/announce", locals: { message: message })
      }.to_json
    )
  end
end
