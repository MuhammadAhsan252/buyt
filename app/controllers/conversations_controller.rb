class ConversationsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_conversation, only: [:show]
  
    def index
      if current_buyer
        @conversations = current_buyer.conversations.includes(:seller)
      elsif current_seller
        @conversations = current_seller.conversations.includes(:buyer)
      else
        @conversations = []
      end
    end
  
    def show
        if current_buyer
            @conversations = current_buyer.conversations.includes(:seller)
        elsif current_seller
            @conversations = current_seller.conversations.includes(:buyer)
        else
            @conversations = []
        end
        @messages = @conversation.messages.order(created_at: :asc)
        @message = Message.new
    end
  
    private
  
    def set_conversation
      @conversation = Conversation.find(params[:id])
      unless @conversation.buyer == current_buyer || @conversation.seller == current_seller
        redirect_to conversations_path, alert: "You are not part of this conversation"
      end
    end
  
    def authenticate_user!
      redirect_to root_path unless current_user.present?
    end
  
    def current_user
      current_buyer || current_seller
    end
  end
  