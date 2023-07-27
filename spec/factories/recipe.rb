# frozen_string_literal: true

# spec/factories/recipe.rb

FactoryBot.define do
  factory :recipe do
    name { 'Delicious Recipe' }
    instructions { 'Cook it with love.' }
    cooking_time { 30 }
    cuisine { 'Italian' }
  end
end
