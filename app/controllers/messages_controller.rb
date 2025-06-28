class MessagesController < ApplicationController
  def index
    # Fake conversation logic for now – lists all users except current_user
    @conversations = User.where.not(id: current_user.id)
  end

  def show
    @user = User.find(params[:id])
    @messages = Message.where(
      sender_id: [current_user.id, @user.id],
      receiver_id: [current_user.id, @user.id]
    ).order(:created_at)
  end

  def create
    @message = Message.new(
      sender_id: current_user.id,
      receiver_id: params[:receiver_id],
      content: params[:content]
    )
    if @message.save
      redirect_to message_path(params[:receiver_id])
    else
      render :show
    end
  end
end
