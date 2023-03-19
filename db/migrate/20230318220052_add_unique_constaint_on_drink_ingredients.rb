class AddUniqueConstaintOnDrinkIngredients < ActiveRecord::Migration[6.1]
  def change
    add_index :drink_ingredients, [:drink_id, :ingredient_id], unique: true

  end
end
