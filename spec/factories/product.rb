# frozen_string_literal: true

require 'factory_bot'
FactoryBot.define do
  factory :product do
    name { 'Zapatillas' }
    review { 4.0 }
    sport { 'Soccer' }
    price { 40_000 }
    stock { 3 }
    size { 42 }
  end
end
