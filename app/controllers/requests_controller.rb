# frozen_string_literal: true

# app/controllers/requests_controller.rb
# class that controlls crucial methods for requests crud
class RequestsController < ApplicationController
  before_action :authenticate_user!
  # @user = current_user
  
  def new
    @product = Product.find(params[:product_id])
    @request = Request.new

    # @products = Product.all
    # @product_id = params[:user_id]
    # @request = Request.new
  end

  def create
    @product = Product.find(params[:product_id])
    @quantity = params[:quantity]
    # request_params[:product] = Product.find(params[:request][:product_id].to_i)
    @request = Request.new(request_params)
    @request.user = current_user
    @request.product = @product

    if @request.save
      @order = current_order
      @order.order_items.each do |order_item|
        order_item.destroy
      end
      redirect_to requests_index_path
    else
      # @product_id = params[:request][:product_id].to_i
      render action: 'new', notice: 'Error al crear solicitud'
    end

  end

  def index
    @order_item = current_order.order_items.new
    @order_items = current_order.order_items
    @requests = if current_user.user?
                  @current_user.requests
                else
                  Request.all
                end
  end

  def show
    @order_item = current_order.order_items.new
    @order_items = current_order.order_items
    @request = Request.find(params[:id])
  end

  def edit
    @order_item = current_order.order_items.new
    @order_items = current_order.order_items
    @request = Request.find(params[:id])
    @product = @request.product
  end

  def update
    @request = Request.find(params[:id])
    @request.update(request_params)

    if @request.save
      redirect_to requests_index_path, notice: 'Request changed succesfully'
    else
      redirect_to requests_index_path, notice: 'Request change failed'
    end
  end

  def destroy
    @request = Request.find(params[:id])
    @requests = if current_user.user?
                  @current_user.requests
                else
                  Request.all
                end

    if params[:how_many] == 'all'
      @requests.each do |request|
        request.destroy
      end
      redirect_to requests_index_path, notice: 'All requests deleted succesfully'
    else
      @request.destroy
      redirect_to requests_index_path, notice: 'Request deleted'
    end
  end

  private

  def request_params
    params.require(:request).permit(:request_date, :state, :days, :product_id, :quantity)
  end
end
