class MessagesController < ApplicationController
  before_action :authenticate_user!

  # 📨 Show all conversations
  def index
    # Users the current user has exchanged messages with
    @conversations = User
      .joins("INNER JOIN messages ON users.id = messages.sender_id OR users.id = messages.receiver_id")
      .where("messages.sender_id = :id OR messages.receiver_id = :id", id: current_user.id)
      .distinct
      .where.not(id: current_user.id)
  end

  # 💬 Show chat with a specific user
  def show
    @user = User.find(params[:id])
    @messages = Message.where(
      "(sender_id = :user AND receiver_id = :me) OR (sender_id = :me AND receiver_id = :user)",
      user: @user.id, me: current_user.id
    ).order(:created_at)
  end

# 🚀 Send a message
def create
  # Find or create the conversation between current_user and receiver
  conversation = Conversation.between(current_user.id, params[:receiver_id]).first_or_create(
    sender_id: current_user.id,
    recipient_id: params[:receiver_id]
  )

  # Create the message in that conversation
  message = Message.new(
    sender_id: current_user.id,
    receiver_id: params[:receiver_id],
    content: params[:content],
    conversation_id: conversation.id
  )

  if message.save
    redirect_to message_path(params[:receiver_id])
  else
    redirect_back fallback_location: messages_path, alert: "Message failed to send."
  end
end

end
