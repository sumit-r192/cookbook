# frozen_string_literal: true

class RecipesController < ApplicationController
  def index
    @cuisine = params[:cuisine]&.downcase
    @ingredient = params[:ingredient]&.downcase

    @recipes = Recipe.includes(:ingredients).where(nil)

    # Search by cuisine
    search_by_cuisine if @cuisine.present?

    return unless @ingredient.present?

    # Search by ingredient
    search_by_ingredient
  end

  def search_by_cuisine
    @recipes = @recipes.where('lower(recipes.cuisine) LIKE ? OR lower(recipes.name) LIKE ?', "%#{@cuisine}%", "%#{@cuisine}%")
  end

  def search_by_ingredient
    @recipes = @recipes.joins(:ingredients).where('lower(ingredients.name) LIKE ?', "%#{@ingredient}%")
  end
end
