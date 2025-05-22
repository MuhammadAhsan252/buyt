class MessagesController < ApplicationController
    before_action :set_conversation
  
    def create
      @message = @conversation.messages.build(message_params.merge(sender: current_user))
      @message.save
    end
  
    private
  
    def set_conversation
      @conversation = Conversation.find(params[:conversation_id])
    end
  
    def message_params
      params.require(:message).permit(:content)
    end
end
  