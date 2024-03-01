class SettingsController < ApplicationController
  def index
  end

  def create 
    Rails.logger.info "test"
    existing_conversation = Conversation.joins(:user_conversations)
      .where(user_conversations: { user_id: current_user.user_id })
      .or(Conversation.joins(:user_conversations)
          .where(user_conversations: { user_id: params[:user_id] }))
      .where(conversation_type: "Single")
      .group("conversations.conversation_id")
      .having("COUNT(user_conversations.user_id) = 2")
      .first

    if existing_conversation.nil?
      @conversation = Conversation.create!(created_by: current_user.user_id, conversation_type: "Single")
      UserConversation.create(user_id: current_user.user_id, conversation_id: @conversation.conversation_id)
      UserConversation.create(user_id: params[:user_id], conversation_id: @conversation.conversation_id)
    else
      @conversation = existing_conversation
    end
    redirect_to message_path(@conversation)
  end
end
