# frozen_string_literal: true

class RecipesController < ApplicationController
  def index
    cuisine = params[:cuisine]&.downcase
    ingredient = params[:ingredient]&.downcase

    @recipes = Recipe.includes(:ingredients)

    # Search by cuisine
    @recipes = @recipes.where('lower(cuisine) LIKE ?', "%#{cuisine}%") if cuisine.present?

    # Search by ingredient
    return unless ingredient.present?

    @recipes = @recipes.joins(:ingredients)
                       .where('lower(ingredients.name) LIKE ?', "%#{ingredient}%")
                       .distinct
  end
end
