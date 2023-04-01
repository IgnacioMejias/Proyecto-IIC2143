# frozen_string_literal: true

# Controller for reviews
class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @order_item = current_order.order_items.new
    @order_items = current_order.order_items
    @product = Product.find(params[:product_id])
    @review = Review.new
  end

  def create
    @product = Product.find(params[:product_id])
    @products = Product.all
    @review = Review.new(review_params)
    @review.user = current_user
    @review.product = @product # quizas es sin el @

    if @review.save
      @product.update(review: ((@product.review * (@product.reviews.count - 1)) +
                      @review.score) / @product.reviews.count)
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def index
    @order_item = current_order.order_items.new
    @order_items = current_order.order_items
    @reviews = if current_user.user?
                 @current_user.reviews
               else
                 Review.all
               end
  end

  def edit
    @order_item = current_order.order_items.new
    @order_items = current_order.order_items
    @review = Review.find(params[:id])
    @product = @review.product
  end

  def update
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    @last_value = @review.score
    @review.update(review_params)

    if @review.save
      @product.update(review: ((@product.review * @product.reviews.count)
                               - @last_value + @review.score) / @product.reviews.count)
      redirect_to reviews_index_path # quizas cambiarla
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @product = @review.product
    if (@product.reviews.count - 1).zero?
      @product.update(review: 0)
    else
      @product.update(review: ((@product.review * @product.reviews.count)
                               - @review.score) / (@product.reviews.count - 1))
    end
    @review.destroy
    redirect_to reviews_index_path
  end

  private

  def review_params
    params.require(:review).permit(:title, :description, :score, :product_id)
  end
end
