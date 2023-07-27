# frozen_string_literal: true

class CreateIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :quantity # in grams
      t.integer :recipe_id

      t.timestamps
    end
  end
end
