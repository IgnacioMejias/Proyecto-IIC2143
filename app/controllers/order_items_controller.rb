# frozen_string_literal: true

# controller for items added to cart
class OrderItemsController < ApplicationController
  before_action :authenticate_user!
  def create
    @order = current_order
    @order_item = @order.order_items.new(order_params)
    @order.save
    session[:order_id] = @order.id
    redirect_to products_path
  end

  def show 
    @order = current_order
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = current_order.order_items
    redirect_back(fallback_location: params[:location])
  end

  private

  def order_params
    params.require(:order_item).permit(:product_id, :quantity)
  end
end
