class PagesController < ApplicationController
  layout 'chatzone'
  def home
  end

  def show 
    @conversation = Conversation.find_by(conversation_id: params[:id])
  end
end
