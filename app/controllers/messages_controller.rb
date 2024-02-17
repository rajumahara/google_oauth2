class MessagesController < ApplicationController
  def index
  end

  def show
    @conversation = Conversation.find_by(conversation_id: params[:id])
  end

  def new
  end

  def create
    content = params[:message][:content]
    conversation_id = params[:message][:conversation_id]
    sender = current_user.id
    @conversation = Conversation.find_by(conversation_id: conversation_id)
    message_receiver_users = @conversation.user_conversations.where.not(user_id: sender).all
    message_receiver_users.each do |receiver|
      Message.create(content: content, conversation_id: conversation_id, sender: sender, receiver: receiver)
    end
    redirect_to message_path(conversation_id)
  end

  def edit
  end

  def update
  end
end
