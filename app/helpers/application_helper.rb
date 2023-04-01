# frozen_string_literal: true

# Modulos sin comentarios
module ApplicationHelper
  def current_order
    if session[:order_id].nil?
      Order.new
    else
      Order.find(session[:order_id])
    end
  end
end
