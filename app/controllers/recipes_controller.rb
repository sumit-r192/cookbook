# frozen_string_literal: true

class RecipesController < ApplicationController
  def index
    @cuisine = params[:cuisine]&.downcase
    @ingredient = params[:ingredient]&.downcase

    @recipes = Recipe.includes(:ingredients)

    # Search by cuisine
    search_by_cuisine if @cuisine.present?

    return unless @ingredient.present?

    # Search by ingredient
    search_by_ingredient
  end

  def search_by_cuisine
    @recipes = @recipes.where('lower(cuisine) LIKE ?', "%#{@cuisine}%")
  end

  def search_by_ingredient
    @recipes = @recipes.joins(:ingredients)
                       .where('lower(ingredients.name) LIKE ?', "%#{@ingredient}%")
                       .distinct
  end
end
