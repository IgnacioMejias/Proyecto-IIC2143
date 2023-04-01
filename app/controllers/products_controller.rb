# frozen_string_literal: true

# app/controllers/products_controller.rb
# class that controlls crucial methods for product crud
class ProductsController < ApplicationController
  before_action :product_search, except: %i[index new create]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @filter = params[:filter]

    @order_item = current_order.order_items.new
    @order_items = current_order.order_items

    filter = params[:filter]
    @products = if !filter || (filter == 'All')
                  Product.all
                else
                  Product.where(sport: @filter)
                end
  end

  def show
    @reviews = @product.reviews.all
    @order_item = current_order.order_items.new
    @order_items = current_order.order_items
  end

  def new
    @product = Product.new
  end

  def create
    @product = current_user.products.build(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def edit; end

  def update
    @product.update(product_params)
    if @product.save
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  def search
    query = params[:search]

    results = Product.where('name LIKE ?', '%<query>#s%')
  end

  private

  def product_search
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :review, :sport, :price, :stock, :size, images: [])
  end
end
