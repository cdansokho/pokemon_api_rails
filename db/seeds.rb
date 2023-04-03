# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'csv'

def import_pokemons_from_csv
  csv_file_path = 'data/pokemons.csv'
  CSV.foreach(csv_file_path, headers: true) do |row|
    pokemon = Pokemon.new
    pokemon.name = row['Name']
    pokemon.type_1 = row['Type 1']
    pokemon.type_2 = row['Type 2']
    pokemon.total = row['Total']
    pokemon.hp = row['HP']
    pokemon.attack = row['Attack']
    pokemon.defense = row['Defense']
    pokemon.sp_atk = row['Sp. Atk']
    pokemon.sp_def = row['Sp. Def']
    pokemon.speed = row['Speed']
    pokemon.generation = row['Generation']
    pokemon.legendary = row['Legendary']
    pokemon.save
  end
end

puts "Start import"
import_pokemons_from_csv
puts "End import"

