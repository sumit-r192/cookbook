# frozen_string_literal: true

# lib/tasks/fake_data.rake

desc 'Generate fake data for testing'
task generate_fake_data: :environment do
  # Generate fake data for Recipe model
  10.times do
    recipe = Recipe.create(
      name: Faker::Food.dish,
      instructions: Faker::Lorem.paragraph(sentence_count: 3),
      cooking_time: Faker::Number.between(from: 5, to: 120),
      cuisine: Recipe::CUISINES.sample
    )

    5.times do
      recipe.ingredients.create(
        name: Faker::Food.ingredient,
        quantity: Faker::Number.between(from: 1, to: 10)
      )
    end
  end
end
