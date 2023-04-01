# frozen_string_literal: true

require 'factory_bot'
require 'faker'

FactoryBot.define do
  factory :user do
    admin { true }
    email { Faker::Internet.email }
    created_at { nil }
    updated_at { nil }
    name { Faker::Name.name }
    password { Faker::Internet.password }
    phone { '93496605' }
    role { 'admin' }
  end
end
