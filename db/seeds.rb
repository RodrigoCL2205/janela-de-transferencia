# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# puts 'Cleaning players database...'
# Player.destroy_all
# puts 'Starting players seed...'

# position = ['Goleiro', 'Lateral esquerdo', 'Lateral direito', 'Zagueiro', 'Volante', 'Meia', 'Atacante']

# 50.times do
#   player = Player.create(
#     name: Faker::Sports::Football.player,
#     position: position[rand(0..6)],
#     price: rand(5..50)*1_000_000,
#     age: rand(18..60)
#   )
#   puts "Included #{player.name}"
# end

# puts "Seed completed succesfully"


# FEEDING THE PLAYERS TABLE
# Scrapping of the site www.transfermarket.com

require 'open-uri'
require 'nokogiri'

puts "Destroying all Deals"
Deal.destroy_all
puts "All deals destroyed!"

puts "Destroying all players"
Player.destroy_all
puts "All players destroyed!"



url_ing = "https://www.transfermarkt.com.br/premier-league/marktwerte/wettbewerb/GB1"

url_bra = "https://www.transfermarkt.com.br/campeonato-brasileiro-serie-a/marktwerte/wettbewerb/BRA1"

url_fra = "https://www.transfermarkt.com.br/ligue-1/marktwerte/wettbewerb/FR1"

url_ita = "https://www.transfermarkt.com.br/serie-a/marktwerte/wettbewerb/IT1"

url_ale = "https://www.transfermarkt.com.br/1-bundesliga/marktwerte/wettbewerb/L1"

url_esp = "https://www.transfermarkt.com.br/laliga/marktwerte/wettbewerb/ES1"


array_url = [url_bra, url_ing, url_fra, url_ita, url_ale, url_esp]

# Array of all Leagues to scrapping
array_url.each do |url|

  html_file = URI.open(url).read
  html_doc = Nokogiri::HTML(html_file)

  # Begining of the Scrapping
  html_doc.search('.odd').each do |element| # odds row
    unless element.search('a').attribute("title").nil?
      puts "Creating even Player"

      name = element.search('a').attribute("title") # Name of the players
      puts "Name: #{name}" unless name.nil?

      price = element.search('td span').text # Price
      price = price.delete_suffix(" mi. €  ").to_i
      price *= 1_000_000
      puts "Price: #{price}" unless price.nil?

      age = element.search('.zentriert')[2].children.text # Idade
      puts "Age: #{age}" unless age.nil?

      position = element.search('.inline-table td')[2].children.text.titleize
      puts "Posição #{position}"

      image_url = element.search(".bilderrahmen-fixed").attribute("data-src").value
      puts image_url

      player = Player.new(
        name: name,
        price: price,
        age: age,
        position: position,
        image_url: image_url
      )
      player.save!

      puts "Player created"
    end
  end

  html_doc.search('.even').each do |element| # linhas pares
    unless element.search('a').attribute("title").nil?
      puts "Creating odd Player"

      name = element.search('a').attribute("title") # Name of the players
      puts "Name: #{name}" unless name.nil?

      price = element.search('td span').text # Price
      price = price.delete_suffix(" mi. €  ").to_i
      price *= 1_000_000
      puts "Price: #{price}" unless price.nil?

      age = element.search('.zentriert')[2].children.text.to_i # Idade
      puts "#Age: #{age}" unless age.nil?

      position = element.search('.inline-table td')[2].children.text.titleize
      puts "Posição #{position}"

      image_url = element.search(".bilderrahmen-fixed").attribute("data-src").value
      puts image_url

      player = Player.new(
        name: name,
        price: price,
        age: age,
        position: position,
        image_url: image_url
      )
      player.save!

      puts "Player created"
    end
  end
end

# FEEDING THE USERS TABLE
puts "Destroying all users"
User.destroy_all
puts "All users destroyed!"

# Managers

puts "Creating Users"

# Rodrigo Manager
newuser = User.new({email: 'rodrigo@jt.com', password: '123456', password_confirmation: '123456', manager: true})
newuser.save!

# Ana Manager
newuser = User.new({email: 'ana@jt.com', password: '123456', password_confirmation: '123456', manager: true})
newuser.save!

# Fabio Figueiredo Manager
newuser = User.new({email: 'fabiof@jt.com', password: '123456', password_confirmation: '123456', manager: true})
newuser.save!

# Fabio Arruda Manager
newuser = User.new({email: 'fabioa@jt.com', password: '123456', password_confirmation: '123456', manager: true})
newuser.save!

# Users

newuser = User.new({email: 'castordeandrade@jt.com', password: '123456', password_confirmation: '123456'})
newuser.save!

newuser = User.new({email: 'euricomiranda@jt.com', password: '123456', password_confirmation: '123456'})
newuser.save!

newuser = User.new({email: 'kleberleite@jt.com', password: '123456', password_confirmation: '123456'})
newuser.save!

newuser = User.new({email: 'ebandeirademello@jt.com', password: '123456', password_confirmation: '123456'})
newuser.save!

newuser = User.new({email: 'andressanchez@jt.com', password: '123456', password_confirmation: '123456'})
newuser.save!

newuser = User.new({email: 'emilpinheiro@jt.com', password: '123456', password_confirmation: '123456'})
newuser.save!

newuser = User.new({email: 'alexandrekalil@jt.com', password: '123456', password_confirmation: '123456'})
newuser.save!

newuser = User.new({email: 'alexandremattos@jt.com', password: '123456', password_confirmation: '123456'})
newuser.save!

newuser = User.new({email: 'rodolfolandim@jt.com', password: '123456', password_confirmation: '123456'})
newuser.save!

newuser = User.new({email: 'vicentematheus@jt.com', password: '123456', password_confirmation: '123456'})
newuser.save!

newuser = User.new({email: 'juvenaljuvencio@jt.com', password: '123456', password_confirmation: '123456'})
newuser.save!

newuser = User.new({email: 'marciobraga@jt.com', password: '123456', password_confirmation: '123456'})
newuser.save!

puts "All users created!"

# FEEDING THE DEALS TABLE
