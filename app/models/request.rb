# frozen_string_literal: true

# clase sin comentarios
class Request < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :request_date, :product_id, :days, :user_id, presence: true
  validates :days, numericality: { only_integer: true, greater_than: 0 }

  enum state: %i[pending accepted rejected]
  after_initialize :set_default_role, if: :new_record?
  def set_default_role
    self.state ||= :pending
  end
end
