# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

$ingredients = [
    {name: 'Vodka'},
    {name: 'Gin'},
    {name: 'Rum'},
    {name: 'Tequila'},
    {name: 'Espresso'},
    {name: 'Baileys'},
]

$drinks = [
    { name: "Espresso Martini", ingredients: ['Vodka', 'Espresso', 'Baileys']}
]

def add_all_ingredients
    $ingredients.each do |ingredient_hash|
        Ingredient.find_or_create_by(ingredient_hash)
    end
end


def add_ingredient_to_drink(drink, ingredient)
    ingredient_obj = Ingredient.find_by(name: ingredient)

    drink.ingredients << ingredient_obj unless drink.ingredient_ids.include?(ingredient_obj.id)
end


def add_all_drinks
    $drinks.each do |drink_hash|
        name = drink_hash[:name]
        ingredients = drink_hash[:ingredients]

        drink = Drink.find_or_create_by(name: name)

        ingredients.each do |ingredient|
            add_ingredient_to_drink(drink, ingredient)
        end

        drink.save
    end
end

add_all_ingredients()
add_all_drinks()

# vodka = Ingredient.find_or_create_by(name:"Vodka")
# Ingredient.find_or_create_by(name:"Gin")
# Ingredient.find_or_create_by(name:"Rum")
# Ingredient.find_or_create_by(name:"Tequila")
# espresso = Ingredient.find_or_create_by(name:"Espresso")
# baileys = Ingredient.find_or_create_by(name:"Baileys")


# espresso_martini = Drink.find_or_create_by(name: "Espresso Martini")

# espresso_martini.ingredients << vodka
# espresso_martini.ingredients << espresso
# espresso_martini.ingredients << baileys
# espresso_martini.save