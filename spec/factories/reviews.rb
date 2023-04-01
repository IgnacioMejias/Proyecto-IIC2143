# frozen_string_literal: true

require 'factory_bot'
FactoryBot.define do
  factory :review do
    title { 'Pesimo' }
    description { 'En mal estado' }
    score { 1.5 }
    product { 1 }
  end
end
