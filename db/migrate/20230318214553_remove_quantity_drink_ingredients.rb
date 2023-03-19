class RemoveQuantityDrinkIngredients < ActiveRecord::Migration[6.1]
  def change
    remove_column :drink_ingredients, :quantity

  end
end
