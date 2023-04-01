# frozen_string_literal: true

# controller for shopping cart
class CartsController < ApplicationController
  before_action :authenticate_user!
  def show
    @order_items = current_order.order_items
  end

  def request_all
    @order_items = current_order.order_items # lista de productos en carrito

    @order_items.each do |item|
      # crear request para cada producto
      @request = Request.new(Date.today, item.product.id, days = 5)
    end
    
  end

  def destroy
    cart.destroy
    redirect_to products_path, notice: 'Cart deleted'
  end
end
