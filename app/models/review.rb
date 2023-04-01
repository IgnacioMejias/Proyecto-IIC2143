# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :title, :description, :score, presence: true
  validates :score, numericality: { only_float: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
end
