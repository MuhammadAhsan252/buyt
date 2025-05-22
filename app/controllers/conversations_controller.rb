class ConversationsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_conversation, only: [:show]

    def start
        @buyer = Buyer.find(params[:buyer_id])
        @seller = Seller.find(params[:seller_id])
        @conversations = current_user.conversations
        conversation = Conversation.find_by(buyer: @buyer, seller: @seller)
        if conversation
            redirect_to conversation_path(conversation)
        end
    end

    def create
        @content = params[:conversation][:content]
        @conversation = Conversation.new(conversation_params)

        if @content.present?
            @conversation.save
            @message = Message.create(content: @content, conversation: @conversation, sender: current_user)
            @message.save
            redirect_to conversation_path(@conversation)
        end
    end

  
    def index
      @conversations = current_user.conversations
    end
  
    def show
        @conversations = current_user.conversations
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

    def conversation_params
      params.require(:conversation).permit(:buyer_id, :seller_id)
    end
  end
  