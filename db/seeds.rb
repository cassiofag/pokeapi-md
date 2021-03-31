# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'pokemon.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'UTF-8')
csv.each do |row|
  pokemon = Pokemon.create({
    pokedex_number: row['#'].to_i,
    name: row['Name'],
    type_1: row['Type 1'],
    type_2: row['Type 2'],
    total: row['Total'].to_i,
    hp: row['HP'].to_i,
    attack: row['Attack'].to_i,
    defense: row['Defense'].to_i,
    sp_atk: row['Sp. Atk'].to_i,
    sp_def: row['Sp. Def'].to_i,
    speed: row['Speed'].to_i,
    generation: row['Generation'].to_i,
    legendary: row['Legendary'].downcase == "true"
  })
  puts "#{pokemon.id} - #{pokemon.name} saved!"
end