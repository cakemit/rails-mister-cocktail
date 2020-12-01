require 'open-uri'
require 'json'

puts "Cleaning all databases"
Dose.destroy_all
Cocktail.destroy_all
Ingredient.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients = JSON.parse(open(url).read)["drinks"]

puts "Creating ingredients..."
ingredients.each do |ingredient|
  Ingredient.create!(name: ingredient["strIngredient1"])
  puts "Created new ingredient #{ingredient["strIngredient1"]}."
end

new_ingr = "Bailey's"
Ingredient.create!(name: new_ingr)
puts "Created new ingredient #{new_ingr}."

new_ingr = "Amarula"
Ingredient.create!(name: new_ingr)
puts "Created new ingredient #{new_ingr}."

new_ingr = "Blue Curaçao"
Ingredient.create!(name: new_ingr)
puts "Created new ingredient #{new_ingr}."

new_ingr = "Cachaça"
Ingredient.create!(name: new_ingr)
puts "Created new ingredient #{new_ingr}."

new_ingr = "Raki"
Ingredient.create!(name: new_ingr)
puts "Created new ingredient #{new_ingr}."

new_ingr = "Sake"
Ingredient.create!(name: new_ingr)
puts "Created new ingredient #{new_ingr}."

new_ingr = "Ice"
Ingredient.create!(name: new_ingr)
puts "Created new ingredient #{new_ingr}."

puts "Finished creating ingredients."


puts "Creating cocktails"

cocktail_names = [
  "Caipirinha",
  "Mojito",
  "Manhattan",
  "Gin tonic",
  "Martini",
  "Cuba Libre",
  "Margarita",
  "Pisco Sour",
  "Caipiroska",
  "Bloody Mary",
  "Sex on the beach",
  "Piña Colada",
  "Spritz",
  "White Russian",
  "Shirley Temple",
  "Strawberry Daiquiri",
  "Mint Julep"
]

cocktail_names.each_with_index do |name, index|
  file_name = "#{index + 1}.jpg"
  file_path = "app/assets/images/card_imgs/#{file_name}"

  cocktail = Cocktail.new(name: name)
  cocktail.photo.attach(io: File.open(Rails.root + file_path), filename: file_name, content_type: 'image/jpg')
  cocktail.save!
  puts "Created new cocktail #{name} with photo."
end

puts "Finished!"