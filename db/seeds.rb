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
puts "Finished!"
