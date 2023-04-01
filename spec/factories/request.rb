# frozen_string_literal: true

require 'factory_bot'
FactoryBot.define do
  factory :request do
    request_date { '2022-10-20' }
    product_id { 2 }
    days { 4 }
    user_id { 1 }
    association :user
  end
end
