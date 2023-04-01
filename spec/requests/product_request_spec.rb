# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :request do
  before(:all) do
    login_user
    @product = build(:product)
    @product.user_id = 1
    @product.save
  end

  describe 'crear product' do
    it 'si tiene atributos válidos' do
      expect do
        post products_path, params: {
          product: {
            name: @product.name,
            review: @product.review,
            sport: @product.sport,
            price: @product.price,
            stock: @product.stock,
            size: @product.size
          }
        }
      end.to change(Product, :count).by(1)
    end

    it 'no funciona si no tiene price ' do
      expect do
        post products_path, params: {
          product: {
            name: @product.name,
            review: @product.review,
            sport: @product.sport,
            price: -1,
            stock: @product.stock,
            size: @product.size
          }
        }
      end.to change(Product, :count).by(0)
    end

    it 'no funciona si el stock es menor que 0 ' do
      expect do
        post products_path, params: {
          product: {
            name: @product.name,
            review: @product.review,
            sport: @product.sport,
            price: @product.price,
            stock: -1,
            size: @product.size
          }
        }
      end.to change(Product, :count).by(0)
    end
  end
  describe 'actualizar product' do
    it 'si nuevo price es válido' do
      patch product_path(@product), params: {
        product: {
          name: @product.name,
          review: @product.review,
          sport: @product.sport,
          price: 35_000,
          stock: @product.stock,
          size: @product.size
        }
      }
      expect(Product.find(@product.id).price).to eq(35_000)
    end

    it 'si nuevo name no es válido' do
      patch product_path(@product), params: {
        product: {
          name: '',
          review: @product.review,
          sport: @product.sport,
          price: @product.price,
          stock: @product.stock,
          size: @product.size
        }
      }
      expect(Product.find(@product.id).name).to eq(@product.name)
    end
  end

  describe 'delete product' do
    it 'borra product si existe' do
      expect do
        delete product_path(@product)
      end.to change(Product, :count).by(-1)
    end
  end
end
