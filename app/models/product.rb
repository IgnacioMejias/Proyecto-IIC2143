# frozen_string_literal: true

class Product < ApplicationRecord
  has_many_attached :images
  has_many :requests, dependent: :delete_all
  has_many :reviews, dependent: :delete_all
  has_many :order_items, dependent: :delete_all

  belongs_to :user

  validates :name, :sport, :price, :stock, :size, :images, presence: true
  validates :size, numericality: { only_float: true, greater_than: 0 }
  validates :price, numericality: { only_integer: true, greater_than: 0 }
  validates :stock, numericality: { only_integer: true, greater_than: -1 }
  has_many :reviews
end
