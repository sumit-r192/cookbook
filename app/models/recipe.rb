# frozen_string_literal: true

# app/models/recipe.rb
class Recipe < ApplicationRecord
  has_many :ingredients, dependent: :destroy

  validates :name, presence: true, length: { maximum: 100 }
  validates :instructions, presence: true, length: { maximum: 1000 }
  validates :cooking_time, presence: true, numericality: { greater_than: 0 }
end
