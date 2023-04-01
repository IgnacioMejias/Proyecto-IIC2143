# frozen_string_literal: true

# app/controllers/home_controller.rb
# class that controlls crucial methods for home view
class HomeController < ApplicationController
  def index
    @order_item = current_order.order_items.new
    @order_items = current_order.order_items
    @products = Product.all
  end

  def about; end
end
