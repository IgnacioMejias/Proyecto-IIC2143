# frozen_string_literal: true

# app/controllers/conversations_controller.rb
# class that controlls crucial methods for conversations view
class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @order_item = current_order.order_items.new
    @order_items = current_order.order_items
    @users = User.all
    @conversations = Conversation.all
  end

  def create
    @conversation = if Conversation.between(params[:sender_id], params[:recipient_id]).present?
                      Conversation.between(params[:sender_id], params[:recipient_id]).first
                    else
                      Conversation.create!(conversation_params)
                    end
    redirect_to conversation_messages_path(@conversation)
  end

  private

  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
end
