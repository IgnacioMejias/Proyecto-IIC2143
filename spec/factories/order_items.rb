# frozen_string_literal: true

FactoryBot.define do
  factory :order_item do
    quantity { 1 }
    product_id { 1 }
    order_id { 1 }
    total { 1 }
    unit_price { 1 }
  end
end
