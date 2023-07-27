# frozen_string_literal: true

# app/models/recipe.rb
class Recipe < ApplicationRecord
  CUISINES = [
    'Italian',
    'Japanese',
    'Indian',
    'Mexican',
    'Chinese',
    'Thai',
    'Mediterranean',
    'French',
    'Greek',
    'Spanish',
    'American',
    'Middle Eastern',
    'Korean',
    'Vietnamese',
    'Brazilian',
    'British',
    'Australian',
    'Cajun/Creole',
    'Caribbean',
    'German',
    'Russian',
    'African',
    'Turkish',
    'Scandinavian',
    'Irish',
    'Portuguese',
    'Other'
  ].freeze

  has_many :ingredients, dependent: :destroy

  validates :name, presence: true, length: { maximum: 100 }
  validates :instructions, presence: true, length: { maximum: 1000 }
  validates :cooking_time, presence: true, numericality: { greater_than: 0 }
end
