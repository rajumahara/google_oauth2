class SettingsController < ApplicationController
  def index
  end

  def create 
    Rails.logger.info "test"
    @conversation = Conversation.create!(created_by: current_user.user_id, conversation_type: "Single")
    UserConversation.create(user_id: current_user.user_id, conversation_id: @conversation.conversation_id)
    UserConversation.create(user_id: params[:user_id], conversation_id: @conversation.conversation_id)
    redirect_to message_path(@conversation)
  end
end
