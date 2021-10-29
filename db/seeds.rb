# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning players database...'
Player.destroy_all
puts 'Starting players seed...'

position = ['Goleiro', 'Lateral esquerdo', 'Lateral direito', 'Zagueiro', 'Volante', 'Meia', 'Atacante']

50.times do
  player = Player.create(
    name: Faker::Sports::Football.player,
    position: position[rand(0..6)],
    price: rand(5..50)*1_000_000,
    age: rand(18..60)
  )
  puts "Included #{player.name}"
end

puts "Seed completed succesfully"
