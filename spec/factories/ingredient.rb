# frozen_string_literal: true

# spec/factories/ingredient.rb

FactoryBot.define do
  factory :ingredient do
    name { 'Some Ingredient' }

    recipe { association :recipe }
  end
end
