require "open-uri"

RoomInterest.delete_all
RoomTopic.delete_all
UserInterest.delete_all
Message.delete_all
Answer.delete_all
Survey.delete_all
Interest.delete_all
User.delete_all
Room.delete_all
Topic.delete_all

interests_list = %w[films séries animaux sport automobile dessin musique cuisine randonnée vélo informatique jeux\ de\ société jeux\ vidéo]
interests_list.each do |interest|
  Interest.create!(name: interest)
end

topics_list = ["Meilleurs films de tous les temps", "Séries - Top 3", "Nouvelle saison de Dexter, bonne ou mauvaise idée ?", "Je suis à court d'inspiration", "Help me", "Bye bye"]
topics_list.each do |topic|
  Topic.create!(subject: topic)
end

room1 = Room.create!(name: "Cinéma", description: "Tout et n'importe quoi autour du cinéma. 🎬")
room1.topics = Topic.all
room1.interests = Interest.where(name: ["films", "séries"])
room2 = Room.create!(name: "Sport", description: "Tout sur le sport. 🏋🏻")
room2.topics = Topic.all
room2.interests = Interest.where(name: ["sport", "randonnée", "vélo"])
room3 = Room.create!(name: "Jeux vidéo", description: "Venez parler jeux vidéo ! 🎮")
room3.topics = Topic.all
room3.interests = Interest.where(name: ["jeux vidéo", "gaming"])
room4 = Room.create!(name: "Cuisine", description: "Toutes les astuces de cuisine. 👨🏻‍🍳")
room4.topics = Topic.all
room4.interests = Interest.where(name: ["cuisine", "recette"])
room5 = Room.create!(name: "Automobile", description: "À fond sur l'actualité auto ! 🚗")
room5.topics = Topic.all
room5.interests = Interest.where(name: ["auto", "voiture"])
room6 = Room.create!(name: "Animaux", description: "Venez parler de votre toutou ! 🐶😺")
room6.topics = Topic.all
room6.interests = Interest.where(name: ["animaux", "chat", "chien"])


file1 = URI.open('https://res.cloudinary.com/dayvtqlm1/image/upload/v1622813252/j3jqz8v1rvcvf68rhnoa2pq6guyu.jpg')
file2 = URI.open('https://res.cloudinary.com/dayvtqlm1/image/upload/v1622813251/5ibaq94061ek2zd9y5b05du4u5h6.jpg')
file3 = URI.open('https://res.cloudinary.com/dayvtqlm1/image/upload/v1622813252/j3jqz8v1rvcvf68rhnoa2pq6guyu.jpg')


user1 = User.create!(username: "toto", email: "toto@toto.com", password: "123456", age: 20)
user1.interests = Interest.where(name: ["films", "automobile", "cuisine"])
user1.photo.attach(io: file1, filename: 'user1.png', content_type: 'image/png')
user2 = User.create!(username: "tutu", email: "tutu@tutu.com", password: "123456", age: 25)
user2.interests = Interest.where(name: ["jeux vidéo", "randonnée"])
user2.photo.attach(io: file2, filename: 'user2.png', content_type: 'image/png')
user3 = User.create!(username: "tata", email: "tata@tata.com", password: "123456", age: 27)
user3.interests = Interest.where(name: ["animaux", "vélo", "films", "informatique"])
user3.photo.attach(io: file3, filename: 'user3.png', content_type: 'image/png')
