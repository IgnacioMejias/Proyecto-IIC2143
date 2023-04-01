# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Review, type: :request do
  before(:all) do
    login_user
    @review = create(:review)
    @review.save
  end

  describe 'crear review' do
    it 'si tiene atributos válidos' do
      expect do
        post requests_path, params: {
          review: {
            title: @review.title,
            product_id: @review.product_id,
            score: @review.score,
            description: @review.description
          }
        }
      end.to change(Review, :count).by(1)
    end

    it 'no funciona si no tiene score ' do
      expect do
        post requests_path, params: {
          review: {
            title: @review.title,
            product_id: @review.product_id,
            score: -1,
            description: @review.description
          }
        }
      end.to change(Review, :count).by(0)
    end
  end

  describe 'delete review' do
    it 'borra review si existe' do
      expect do
        delete request_path(@review)
      end.to change(Review, :count).by(-1)
    end
  end
end
