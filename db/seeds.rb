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

file1 = URI.open('https://res.cloudinary.com/dayvtqlm1/image/upload/v1623313247/toto_hgpjrh.jpg')
file2 = URI.open('https://res.cloudinary.com/dayvtqlm1/image/upload/v1623313247/tutu_zh80vu.jpg')
file3 = URI.open('https://res.cloudinary.com/dayvtqlm1/image/upload/v1623313235/tata_okkeyo.png')
file4 = URI.open('https://res.cloudinary.com/dayvtqlm1/image/upload/v1623314238/fabrice_rtpyz1.jpg')
file5 = URI.open('https://res.cloudinary.com/dayvtqlm1/image/upload/v1623314329/cindy_vtmbef.jpg')
file6 = URI.open('https://res.cloudinary.com/dayvtqlm1/image/upload/v1623399151/laure_g0p7jf.png')
file7 = URI.open('https://res.cloudinary.com/dayvtqlm1/image/upload/v1623399144/pat_zkynoo.png')
file8 = URI.open('https://res.cloudinary.com/dayvtqlm1/image/upload/v1623312982/alex_uubi72.jpg')
file9 = URI.open('https://res.cloudinary.com/dayvtqlm1/image/upload/v1623399135/fanny_mwuzdw.jpg')
file10 = URI.open('https://res.cloudinary.com/dayvtqlm1/image/upload/v1623399466/george_kdwpc7.jpg')
file11 = URI.open ('https://res.cloudinary.com/dayvtqlm1/image/upload/v1623399444/elodie_shcd5b.jpg')



user1 = User.create!(username: "Clément", email: "clement@chinup.com", password: "123456", age: 20)
user1.interests = Interest.where(name: ["films", "automobile", "cuisine"])
user1.photo.attach(io: file1, filename: 'user1.png', content_type: 'image/png')
user2 = User.create!(username: "Joseph", email: "joseph@chinup.com", password: "123456", age: 25)
user2.interests = Interest.where(name: ["jeux vidéo", "randonnée"])
user2.photo.attach(io: file2, filename: 'user2.png', content_type: 'image/png')
user3 = User.create!(username: "Juliette", email: "juliette@chinup.com", password: "123456", age: 27)
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

user9 = User.create!(username: "Fanny", email: "fanny@chinup.com", password: "123456", age: 24)
user9.interests = Interest.where(name: ["cinéma", "cuisine", "jeux vidéo"])
user9.photo.attach(io: file9, filename: 'user9.png', content_type: 'image/png')

user10 = User.create!(username: "George", email: "george@chinup.com", password: "123456", age: 32)
user10.interests = Interest.where(name: ["cinéma", "sport", "animaux"])
user10.photo.attach(io: file10, filename: 'user10.png', content_type: 'image/png')

user11 = User.create!(username: "Elodie", email: "elodie@chinup.com", password: "123456", age: 24)
user11.interests = Interest.where(name: ["cinéma", "vélo", "animaux"])
user11.photo.attach(io: file11, filename: 'user11.png', content_type: 'image/png')


