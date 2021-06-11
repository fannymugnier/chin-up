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

interests_list = %w[films séries animaux sport automobile dessin musique cuisine randonnée vélo informatique jeux\ de\ société jeux\ vidéo photographie bricolage]
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
room7 = Room.create!(name: "Films cultes", description: "Venez parler des meilleurs films de tout les temps ! 🎬")
room7.topics = Topic.all
room7.interests = Interest.where(name: ["films", "séries"])
room8 = Room.create!(name: "Les Bronzés", description: "Pour tout les fans des films de Patrice Leconte ! 😁🎬")
room8.topics = Topic.all
room8.interests = Interest.where(name: ["films", "séries"])
room9 = Room.create!(name: "Tarantino", description: "Venez parler du meilleur réalisateur et scénariste: Quentin Tarantino 🎬")
room9.topics = Topic.all
room9.interests = Interest.where(name: ["films", "séries"])
room10 = Room.create!(name: "Passions atypiques", description: "Venez parler de vos passions qui sortent du commun! 👌😁")
room10.topics = Topic.all
room10.interests = Interest.all
room11 = Room.create!(name: "Aperoom", description: "Prenez votre verre et vos cacahuètes et rejoignez la room chill! 🍻😎🥜")
room11.topics = Topic.all
room11.interests = Interest.all
room12 = Room.create!(name: "Photographie", description: "Partager vos meilleurs spot photo! 📸 🤳")
room12.topics = Topic.all
room12.interests = Interest.where(name: ["photographie"])
room13 = Room.create!(name: "Art", description: "Partager votre artiste, toile , oeuvre, etc... 🖼 🎨")
room13.topics = Topic.all
room13.interests = Interest.where(name: ["photographie", "dessin"])
room14 = Room.create!(name: "Bricolage", description: "Ici on parle marteau, clou, peinture, etc... 😜🛠👨‍🔧👩‍🔧")
room14.topics = Topic.all
room14.interests = Interest.where(name: ["bricolage"])

file1 = URI.open('https://res.cloudinary.com/dayvtqlm1/image/upload/v1623313247/toto_hgpjrh.jpg')
file2 = URI.open('https://res.cloudinary.com/dayvtqlm1/image/upload/v1623313247/tutu_zh80vu.jpg')
file3 = URI.open('https://res.cloudinary.com/dayvtqlm1/image/upload/v1623313235/tata_okkeyo.png')
file4 = URI.open('https://res.cloudinary.com/dayvtqlm1/image/upload/v1623314238/fabrice_rtpyz1.jpg')
file5 = URI.open('https://res.cloudinary.com/dayvtqlm1/image/upload/v1623314329/cindy_vtmbef.jpg')
file6 = URI.open('https://res.cloudinary.com/dayvtqlm1/image/upload/v1623315319/laure_c115a5.jpg')
file7 = URI.open('https://res.cloudinary.com/dayvtqlm1/image/upload/v1623314238/pat_a2tbcu.jpg')
file8 = URI.open('https://res.cloudinary.com/dayvtqlm1/image/upload/v1623312982/alex_uubi72.jpg')

user1 = User.create!(username: "toto", email: "toto@toto.com", password: "123456", age: 20)
user1.interests = Interest.where(name: ["films", "automobile", "cuisine"])
user1.photo.attach(io: file1, filename: 'user1.png', content_type: 'image/png')
user2 = User.create!(username: "tutu", email: "tutu@tutu.com", password: "123456", age: 25)
user2.interests = Interest.where(name: ["jeux vidéo", "randonnée"])
user2.photo.attach(io: file2, filename: 'user2.png', content_type: 'image/png')
user3 = User.create!(username: "tata", email: "tata@tata.com", password: "123456", age: 27)
user3.interests = Interest.where(name: ["animaux", "vélo", "films", "informatique"])
user3.photo.attach(io: file3, filename: 'user3.png', content_type: 'image/png')

user4 = User.create!(username: "Fabrice", email: "fabrice@chinup.com", password: "123456", age: 24)
user4.interests = Interest.where(name: ["films", "jeux vidéo", "cuisine"])
user4.photo.attach(io: file4, filename: 'user4.png', content_type: 'image/png')

user5 = User.create!(username: "Cindy", email: "cindy@chinup.com", password: "123456", age: 28)
user5.interests = Interest.where(name: ["films", "jeux vidéo", "animaux"])
user5.photo.attach(io: file5, filename: 'user5.png', content_type: 'image/png')

user6 = User.create!(username: "Laure", email: "laure@chinup.com", password: "123456", age: 29)
user6.interests = Interest.where(name: ["films", "randonnée", "animaux"])
user6.photo.attach(io: file6, filename: 'user6.png', content_type: 'image/png')

user7 = User.create!(username: "Pat", email: "pat@chinup.com", password: "123456", age: 33)
user7.interests = Interest.where(name: ["vélo", "jeux vidéo", "animaux"])
user7.photo.attach(io: file7, filename: 'user7.png', content_type: 'image/png')

user8 = User.create!(username: "Alex", email: "alex@chinup.com", password: "123456", age: 25)
user8.interests = Interest.where(name: ["sport", "cuisine", "animaux"])
user8.photo.attach(io: file8, filename: 'user8.png', content_type: 'image/png')

