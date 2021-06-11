film_cultes = Room.find_by(name: 'Films cultes')
passions_atypiques = Room.find_by(name: 'Passions atypiques')

clement =   User.find_by(username: "Clément")
fabrice =   User.find_by(username: "Fabrice")
cindy =     User.find_by(username: "Cindy")
laure =     User.find_by(username: "Laure")
pat =       User.find_by(username: "Pat")
alex =      User.find_by(username: "Alex")
george =    User.find_by(username: "George")

events = [
  {
    type: 'message',
    room: passions_atypiques,
    user: alex,
    message: 'Salut Fanny !'
  },
  {
    type: 'message',
    room: passions_atypiques,
    user: fabrice,
    message: 'Hello !'
  },
  {
    type: 'message',
    room: passions_atypiques,
    user: fabrice,
    message: 'Qui a répondu oui ??'
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
    message: "C'est une passion pour le jeu de l'oie !"
  },
  {
    type: 'message',
    room: passions_atypiques,
    user: alex,
    message: "Alors ça, c'est atypique..."
  },
  {
    type: 'message',
    room: film_cultes,
    user: pat,
    message: "Salut Fanny !"
  },
  {
    type: 'message',
    room: film_cultes,
    user: clement,
    message: "Bienvenue dans la room :)"
  },
  {
    type: 'message',
    room: film_cultes,
    user: laure,
    message: "Salut Fanny, on vient de finir de parler de Truman Show."
  },
  {
    type: 'message',
    room: film_cultes,
    user: pat,
    message: "On lance un nouveau sujet ?"
  },
  {
    type: 'message',
    room: film_cultes,
    user: george,
    message: "Ok je m'en charge !"
  },
  {
    type: 'topic',
    room: film_cultes,
    user: george,
    subject: "Meilleur film de tous les temps"
  },
  {
    type: 'message',
    room: film_cultes,
    user: pat,
    message: "Titanic"
  },
  {
    type: 'message',
    room: film_cultes,
    user: george,
    message: "La Classe Américaine !"
  },
  {
    type: 'message',
    room: film_cultes,
    user: clement,
    message: "Matrix pour moi"
  },
  {
    type: 'message',
    room: film_cultes,
    user: laure,
    message: "Oui mais lequel ?"
  },
  {
    type: 'message',
    room: film_cultes,
    user: clement,
    message: "Non, le Retour du Roi, c'est le meilleur."
  },
  {
    type: 'message',
    room: film_cultes,
    user: pat,
    message: "Perso je suis d'accord avec Fanny."
  },
  {
    type: 'message',
    room: film_cultes,
    user: george,
    message: "Ce serait une bonne idée de lancer un sondage. Fanny, tu t'en charges ?"
  },
  {
    type: 'message',
    room: film_cultes,
    user: george,
    message: "C'est une pépite !"
  },
  {
    type: 'message',
    room: film_cultes,
    user: george,
    message: "C'est un détournement de plusieurs vieux films avec John Wayne. C'est vraiment super drôle ! :D"
  },
  {
    type: 'message',
    room: film_cultes,
    user: george,
    message: "Il est sur youtube, si ça vous dit on le regarde ensemble (bon, en remote, mais c'est toujours mieux que tout seul !) ?"
  },
  {
    type: 'message',
    room: film_cultes,
    user: laure,
    message: "Carrément !"
  },
  {
    type: 'message',
    room: film_cultes,
    user: clement,
    message: "Quelqu'un a le lien svp ?"
  },
  {
    type: 'message',
    room: film_cultes,
    user: george,
    message: "https://www.youtube.com/watch?v=W8sop56DBUs&t=127s"
  },
  {
    type: 'message',
    room: film_cultes,
    user: pat,
    message: "On lance dans 10min?"
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
