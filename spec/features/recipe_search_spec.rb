# frozen_string_literal: true

# spec/features/recipe_search_spec.rb

require 'rails_helper'

RSpec.describe 'Recipe Search', type: :feature do
  def create_recipe_with_ingredients(name, cuisine, ingredient_names)
    recipe = FactoryBot.create(:recipe, name:, cuisine:)
    ingredient_names.each do |ingredient_name|
      FactoryBot.create(:ingredient, name: ingredient_name, recipe:)
    end
    recipe
  end

  # Test cases
  describe 'Searching for recipes' do
    before do
      create_recipe_with_ingredients('Pasta Recipe', 'Italian', %w[Pasta Tomatoes])
      create_recipe_with_ingredients('Sushi Recipe', 'Japanese', %w[Rice Nori Fish])
      create_recipe_with_ingredients('Pizza Recipe', 'Italian', %w[Dough Cheese Tomatoes])
    end

    it 'displays all recipes when no search criteria is provided' do
      visit root_path
      click_button 'Search'

      # All recipes are displayed
      expect(page).to have_content('Pasta Recipe')
      expect(page).to have_content('Sushi Recipe')
      expect(page).to have_content('Pizza Recipe')
    end

    it 'displays recipes matching cuisine' do
      visit root_path
      fill_in 'Cuisine', with: 'Italian'
      click_button 'Search'

      # Only Italian recipes are displayed
      expect(page).to have_content('Pasta Recipe')
      expect(page).to have_content('Pizza Recipe')
      expect(page).not_to have_content('Sushi Recipe')
    end

    it 'displays recipes matching ingredient' do
      visit root_path
      fill_in 'Ingredient', with: 'Pasta'
      click_button 'Search'

      # Only recipes with Pasta as an ingredient are displayed
      expect(page).to have_content('Pasta Recipe')
      expect(page).not_to have_content('Sushi Recipe')
      expect(page).not_to have_content('Pizza Recipe')
    end

    it 'displays recipes matching both cuisine and ingredient' do
      visit root_path
      fill_in 'Cuisine', with: 'Italian'
      fill_in 'Ingredient', with: 'Tomatoes'
      click_button 'Search'

      # Only Italian recipes with Tomatoes as an ingredient are displayed
      expect(page).to have_content('Pasta Recipe')
      expect(page).not_to have_content('Sushi Recipe')
      expect(page).to have_content('Pizza Recipe')
    end

    it 'displays "No recipes found" when no matching recipes' do
      visit root_path
      fill_in 'Cuisine', with: 'Indian'
      fill_in 'Ingredient', with: 'Chicken'
      click_button 'Search'

      # "No recipes found" message is displayed
      expect(page).to have_content('No recipes found')
    end
  end
end
